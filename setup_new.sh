#!/bin/bash
set -e
echo "[ELAINA] setup..."

cat > "README.md" <<'__EOF__'
# ELAINA Optimasi

Turbo tap (macro klik cepat) + pembersih RAM + pelicin layar via **Shizuku**.

## Build APK
Actions → Build APK → Run workflow → download artifact.

__EOF__

mkdir -p "app"
cat > "app/build.gradle.kts" <<'__EOF__'
plugins {
    id("com.android.application")
    id("org.jetbrains.kotlin.android")
}
android {
    namespace = "com.elaina.optimasi"
    compileSdk = 34
    defaultConfig {
        applicationId = "com.elaina.optimasi"
        minSdk = 29
        targetSdk = 34
        versionCode = 1
        versionName = "1.0"
    }
    buildTypes { release { isMinifyEnabled = false } }
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
    kotlinOptions { jvmTarget = "17" }
}
dependencies {
    implementation("androidx.core:core-ktx:1.12.0")
    implementation("dev.rikka.shizuku:api:4.1.0")
    implementation("dev.rikka.shizuku:provider:4.1.0")
}

__EOF__

mkdir -p "app/src/main"
cat > "app/src/main/AndroidManifest.xml" <<'__EOF__'
<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android">
    <uses-permission android:name="android.permission.SYSTEM_ALERT_WINDOW" />
    <uses-permission android:name="android.permission.FOREGROUND_SERVICE" />
    <uses-permission android:name="android.permission.POST_NOTIFICATIONS" />
    <queries>
        <package android:name="moe.shizuku.privileged.api" />
    </queries>
    <application
        android:label="ELAINA Optimasi"
        android:icon="@drawable/ic_launcher"
        android:allowBackup="false"
        android:theme="@android:style/Theme.DeviceDefault.NoActionBar">
        <activity android:name=".MainActivity" android:exported="true" android:screenOrientation="portrait">
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />
                <category android:name="android.intent.category.LAUNCHER" />
            </intent-filter>
        </activity>
        <service android:name=".TapService" android:exported="false" />
        <service android:name=".CrossService" android:exported="false" />
        <provider
            android:name="rikka.shizuku.ShizukuProvider"
            android:authorities="${applicationId}.shizuku"
            android:multiprocess="false"
            android:enabled="true"
            android:exported="true"
            android:permission="android.permission.INTERACT_ACROSS_USERS_FULL" />
    </application>
</manifest>

__EOF__

mkdir -p "app/src/main/java/com/elaina/optimasi"
cat > "app/src/main/java/com/elaina/optimasi/CrossService.kt" <<'__EOF__'
package com.elaina.optimasi

import android.app.Service
import android.content.Intent
import android.graphics.Canvas
import android.graphics.Color
import android.graphics.Paint
import android.graphics.PixelFormat
import android.os.IBinder
import android.view.Gravity
import android.view.View
import android.view.WindowManager

class CrossService : Service() {
    companion object {
        @JvmField var running = false
    }
    private var wm: WindowManager? = null
    private var view: View? = null

    override fun onBind(i: Intent?): IBinder? = null

    override fun onStartCommand(i: Intent?, f: Int, id: Int): Int {
        if (view != null) return START_STICKY
        running = true
        wm = getSystemService(WINDOW_SERVICE) as WindowManager
        val cross = object : View(this) {
            private val p = Paint(Paint.ANTI_ALIAS_FLAG).apply {
                color = 0xFF39FF88.toInt()
                strokeWidth = 3f
                style = Paint.Style.STROKE
            }
            private val dot = Paint(Paint.ANTI_ALIAS_FLAG).apply {
                color = 0xFF39FF88.toInt()
                style = Paint.Style.FILL
            }
            override fun onDraw(c: Canvas) {
                val cx = width / 2f
                val cy = height / 2f
                val len = 18f
                val gap = 6f
                c.drawLine(cx - len, cy, cx - gap, cy, p)
                c.drawLine(cx + gap, cy, cx + len, cy, p)
                c.drawLine(cx, cy - len, cx, cy - gap, p)
                c.drawLine(cx, cy + gap, cx, cy + len, p)
                c.drawCircle(cx, cy, 2.5f, dot)
            }
        }
        val lp = WindowManager.LayoutParams(
            120, 120,
            WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY,
            WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE or
                WindowManager.LayoutParams.FLAG_NOT_TOUCHABLE or
                WindowManager.LayoutParams.FLAG_LAYOUT_IN_SCREEN,
            PixelFormat.TRANSLUCENT
        ).apply {
            gravity = Gravity.CENTER
        }
        view = cross
        try { wm?.addView(cross, lp) } catch (_: Exception) { running = false; stopSelf() }
        return START_STICKY
    }

    override fun onDestroy() {
        running = false
        view?.let { try { wm?.removeView(it) } catch (_: Exception) {} }
        view = null
        super.onDestroy()
    }
}

__EOF__

mkdir -p "app/src/main/java/com/elaina/optimasi"
cat > "app/src/main/java/com/elaina/optimasi/MainActivity.kt" <<'__EOF__'
package com.elaina.optimasi

import android.app.Activity
import android.app.ActivityManager
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.graphics.Color
import android.graphics.drawable.GradientDrawable
import android.net.Uri
import android.os.BatteryManager
import android.os.Build
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import android.provider.Settings
import android.view.Gravity
import android.view.View
import android.widget.*

class MainActivity : Activity() {
    private val h = Handler(Looper.getMainLooper())
    private var cps = 12
    private var tab = 0
    private var content: FrameLayout? = null
    private var nav: LinearLayout? = null
    private var monitorRun: Runnable? = null

    override fun onCreate(b: Bundle?) {
        super.onCreate(b)
        window.statusBarColor = BG
        val root = LinearLayout(this).apply {
            orientation = LinearLayout.VERTICAL
            setBackgroundColor(BG)
        }
        content = FrameLayout(this)
        root.addView(content, LinearLayout.LayoutParams(-1, 0, 1f))
        nav = LinearLayout(this).apply { setBackgroundColor(PANEL) }
        listOf("TURBO", "CROSSHAIR", "MONITOR").forEachIndexed { i, name ->
            val t = TextView(this).apply {
                text = name; textSize = 12f; gravity = Gravity.CENTER
                setPadding(0, dp(16), 0, dp(16))
                setTextColor(MUTE)
                setOnClickListener { showTab(i) }
            }
            nav!!.addView(t, LinearLayout.LayoutParams(0, -2, 1f))
        }
        root.addView(nav, LinearLayout.LayoutParams(-1, -2))
        setContentView(root)
        showTab(0)
    }

    override fun onResume() {
        super.onResume()
        if (tab == 0 || tab == 2) showTab(tab)
    }

    override fun onPause() {
        super.onPause()
        monitorRun?.let { h.removeCallbacks(it) }
        monitorRun = null
    }

    private fun showTab(i: Int) {
        tab = i
        monitorRun?.let { h.removeCallbacks(it) }
        monitorRun = null
        for (k in 0 until (nav?.childCount ?: 0)) {
            val t = nav!!.getChildAt(k) as TextView
            val on = k == i
            t.setTextColor(if (on) RED else MUTE)
        }
        val sv = ScrollView(this)
        val col = LinearLayout(this).apply {
            orientation = LinearLayout.VERTICAL
            setPadding(dp(16), dp(20), dp(16), dp(24))
        }
        when (i) {
            0 -> buildTurbo(col)
            1 -> buildCross(col)
            else -> buildMonitor(col)
        }
        sv.addView(col)
        content?.removeAllViews()
        content?.addView(sv)
    }

    private fun buildTurbo(col: LinearLayout) {
        col.addView(title("ELAINA TURBO"))
        col.addView(sub("Macro klik cepat  •  RAM  •  Pelicin"))

        val st = card()
        val ok = ShizukuHelper.granted()
        st.addView(label(ShizukuHelper.status(), 15, if (ok) GREEN else CYAN, true))
        st.addView(label("Semua fitur turbo butuh Shizuku.", 12, MUTE, false))
        col.addView(st, gap(12))

        if (!ShizukuHelper.available()) {
            col.addView(btn("BUKA SHIZUKU") {
                try {
                    startActivity(packageManager.getLaunchIntentForPackage("moe.shizuku.privileged.api"))
                } catch (_: Exception) { toast("Install Shizuku dulu") }
            })
        } else if (!ShizukuHelper.granted()) {
            col.addView(btn("BERI IZIN SHIZUKU") {
                ShizukuHelper.request { r -> h.post { toast(if (r) "OK" else "Ditolak"); showTab(0) } }
            })
        }

        col.addView(section("MACRO KLIK CEPAT"))
        col.addView(label("Kecepatan: $cps CPS", 13, TEXT, true).also { it.id = 9001 })
        col.addView(SeekBar(this).apply {
            max = 20; progress = cps - 5
            progressTintList = android.content.res.ColorStateList.valueOf(RED)
            thumbTintList = android.content.res.ColorStateList.valueOf(RED)
            setOnSeekBarChangeListener(object : SeekBar.OnSeekBarChangeListener {
                override fun onProgressChanged(s: SeekBar?, p: Int, u: Boolean) {
                    cps = p + 5
                    findViewById<TextView>(9001)?.text = "Kecepatan: $cps CPS"
                }
                override fun onStartTrackingTouch(s: SeekBar?) {}
                override fun onStopTrackingTouch(s: SeekBar?) {}
            })
        }, gap(8))

        col.addView(btn("TAMPILKAN TOMBOL TAP") {
            if (!Settings.canDrawOverlays(this)) {
                startActivity(Intent(Settings.ACTION_MANAGE_OVERLAY_PERMISSION, Uri.parse("package:$packageName")))
                toast("Izinkan overlay dulu"); return@btn
            }
            startService(Intent(this, TapService::class.java).putExtra("cps", cps))
            toast("Geser tombol • ketuk = ON/OFF spam")
        })
        col.addView(btn("MATIKAN TOMBOL TAP", false) {
            stopService(Intent(this, TapService::class.java)); toast("Mati")
        })

        col.addView(section("OPTIMASI"))
        col.addView(btn("BERSIHKAN RAM", false) {
            if (!ok) { toast("Shizuku belum siap"); return@btn }
            ShizukuHelper.cleanRam(); toast("RAM dibersihkan")
        })
        col.addView(btn("PELICIN LAYAR ON", false) {
            if (!ok) { toast("Shizuku belum siap"); return@btn }
            ShizukuHelper.animFast(true); toast("Animasi cepat")
        })
        col.addView(btn("PELICIN LAYAR OFF", false) {
            ShizukuHelper.animFast(false); toast("Animasi normal")
        })
    }

    private fun buildCross(col: LinearLayout) {
        col.addView(title("CROSSHAIR"))
        col.addView(sub("Crosshair sederhana di tengah layar"))

        val st = card()
        st.addView(label(if (CrossService.running) "CROSSHAIR AKTIF" else "CROSSHAIR MATI", 15, if (CrossService.running) GREEN else MUTE, true))
        st.addView(label("Muncul titik/cross di tengah layar di atas game.", 12, MUTE, false))
        col.addView(st, gap(12))

        col.addView(btn(if (CrossService.running) "MATIKAN CROSSHAIR" else "NYALAKAN CROSSHAIR") {
            if (!Settings.canDrawOverlays(this)) {
                startActivity(Intent(Settings.ACTION_MANAGE_OVERLAY_PERMISSION, Uri.parse("package:$packageName")))
                toast("Izinkan overlay dulu"); return@btn
            }
            if (CrossService.running) {
                stopService(Intent(this, CrossService::class.java))
            } else {
                startService(Intent(this, CrossService::class.java))
            }
            h.postDelayed({ showTab(1) }, 300)
        })

        col.addView(label("Tips: nyalakan crosshair, lalu buka game. Crosshair tetap di tengah.", 12, MUTE, false), gap(12))
    }

    private fun buildMonitor(col: LinearLayout) {
        col.addView(title("MONITOR"))
        col.addView(sub("Status perangkat"))

        val ramT = label("RAM: ...", 14, TEXT, true)
        val batT = label("Baterai: ...", 14, TEXT, true)
        val cpuT = label("CPU: ...", 14, TEXT, true)
        val devT = label("HP: ${Build.MANUFACTURER} ${Build.MODEL}\nAndroid ${Build.VERSION.RELEASE}", 12, MUTE, false)

        listOf(ramT, batT, cpuT).forEach {
            val c = card(); c.addView(it); col.addView(c, gap(10))
        }
        col.addView(devT, gap(12))
        col.addView(label("CPU % lebih akurat jika Shizuku aktif.", 11, MUTE, false))

        val r = object : Runnable {
            override fun run() {
                val am = getSystemService(ACTIVITY_SERVICE) as ActivityManager
                val mi = ActivityManager.MemoryInfo()
                am.getMemoryInfo(mi)
                val used = (mi.totalMem - mi.availMem) / 1048576
                val total = mi.totalMem / 1048576
                val pct = if (total > 0) (used * 100 / total).toInt() else 0
                ramT.text = "RAM: $used / $total MB ($pct%)"

                val i = registerReceiver(null, IntentFilter(Intent.ACTION_BATTERY_CHANGED))
                val lvl = i?.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) ?: -1
                val sc = i?.getIntExtra(BatteryManager.EXTRA_SCALE, 100) ?: 100
                val temp = (i?.getIntExtra(BatteryManager.EXTRA_TEMPERATURE, 0) ?: 0) / 10f
                val bp = if (lvl >= 0 && sc > 0) lvl * 100 / sc else 0
                batT.text = "Baterai: $bp%  •  ${"%.1f".format(temp)}°C"

                val cores = Runtime.getRuntime().availableProcessors()
                cpuT.text = if (ShizukuHelper.granted()) {
                    "CPU: $cores core  •  Shizuku aktif"
                } else {
                    "CPU: $cores core  •  nyalakan Shizuku"
                }
                h.postDelayed(this, 2000)
            }
        }
        monitorRun = r
        r.run()
    }

    // UI helpers
    private fun title(t: String) = label(t, 26, Color.WHITE, true).also {
        (it.layoutParams as? LinearLayout.LayoutParams)?.bottomMargin = dp(4)
    }
    private fun sub(t: String) = label(t, 13, MUTE, false).also {
        (it.layoutParams as? LinearLayout.LayoutParams)?.bottomMargin = dp(16)
    }
    private fun section(t: String) = label(t, 13, RED, true).also {
        (it.layoutParams as? LinearLayout.LayoutParams)?.apply { topMargin = dp(18); bottomMargin = dp(8) }
    }
    private fun label(t: String, size: Int, col: Int, bold: Boolean) = TextView(this).apply {
        text = t; textSize = size.toFloat(); setTextColor(col)
        if (bold) setTypeface(typeface, android.graphics.Typeface.BOLD)
        layoutParams = LinearLayout.LayoutParams(-1, -2).also { it.bottomMargin = dp(4) }
    }
    private fun card() = LinearLayout(this).apply {
        orientation = LinearLayout.VERTICAL
        setPadding(dp(14), dp(12), dp(14), dp(12))
        background = GradientDrawable().apply { setColor(PANEL); cornerRadius = dp(12).toFloat() }
    }
    private fun btn(t: String, primary: Boolean = true, click: () -> Unit) = TextView(this).apply {
        text = t; textSize = 14f; gravity = Gravity.CENTER; setTextColor(Color.WHITE)
        setPadding(dp(14), dp(13), dp(14), dp(13))
        background = GradientDrawable().apply {
            setColor(if (primary) RED else PANEL2); cornerRadius = dp(10).toFloat()
        }
        setOnClickListener { click() }
        layoutParams = LinearLayout.LayoutParams(-1, -2).also { it.bottomMargin = dp(8) }
    }
    private fun gap(b: Int) = LinearLayout.LayoutParams(-1, -2).also { it.bottomMargin = dp(b) }
    private fun dp(v: Int) = (v * resources.displayMetrics.density).toInt()
    private fun toast(t: String) = Toast.makeText(this, t, Toast.LENGTH_SHORT).show()

    companion object {
        val BG = 0xFF0A0A0F.toInt()
        val PANEL = 0xFF16161F.toInt()
        val PANEL2 = 0xFF2A2A35.toInt()
        val RED = 0xFFFF1744.toInt()
        val GREEN = 0xFF00E676.toInt()
        val CYAN = 0xFF00E5FF.toInt()
        val MUTE = 0xFF888899.toInt()
        val TEXT = 0xFFE0E0E8.toInt()
    }
}

__EOF__

mkdir -p "app/src/main/java/com/elaina/optimasi"
cat > "app/src/main/java/com/elaina/optimasi/ShizukuHelper.kt" <<'__EOF__'
package com.elaina.optimasi

import android.content.pm.PackageManager
import rikka.shizuku.Shizuku
import java.io.BufferedReader
import java.io.InputStreamReader

object ShizukuHelper {
    fun available(): Boolean = try { Shizuku.pingBinder() } catch (_: Exception) { false }
    fun granted(): Boolean = try {
        Shizuku.checkSelfPermission() == PackageManager.PERMISSION_GRANTED
    } catch (_: Exception) { false }

    fun request(cb: (Boolean) -> Unit) {
        try {
            if (Shizuku.isPreV11()) { cb(false); return }
            val listener = object : Shizuku.OnRequestPermissionResultListener {
                override fun onRequestPermissionResult(requestCode: Int, grantResult: Int) {
                    Shizuku.removeRequestPermissionResultListener(this)
                    cb(grantResult == PackageManager.PERMISSION_GRANTED)
                }
            }
            Shizuku.addRequestPermissionResultListener(listener)
            Shizuku.requestPermission(1001)
        } catch (_: Exception) { cb(false) }
    }

    fun shell(cmd: String): String {
        if (!available() || !granted()) return "ERR"
        return try {
            val p = Shizuku.newProcess(arrayOf("sh", "-c", cmd), null, null)
            val out = BufferedReader(InputStreamReader(p.inputStream)).readText()
            p.waitFor()
            out.trim().ifBlank { "OK" }
        } catch (e: Exception) { "ERR:${e.message}" }
    }

    fun tap(x: Int, y: Int) = !shell("input tap $x $y").startsWith("ERR")

    fun cleanRam(): String = shell("am kill-all")

    fun animFast(on: Boolean) {
        val v = if (on) "0.5" else "1"
        shell("settings put global window_animation_scale $v")
        shell("settings put global transition_animation_scale $v")
        shell("settings put global animator_duration_scale $v")
    }

    fun status(): String = when {
        !available() -> "Shizuku OFF"
        !granted() -> "Shizuku ON • izin belum"
        else -> "Shizuku SIAP"
    }
}

__EOF__

mkdir -p "app/src/main/java/com/elaina/optimasi"
cat > "app/src/main/java/com/elaina/optimasi/TapService.kt" <<'__EOF__'
package com.elaina.optimasi

import android.app.Service
import android.content.Intent
import android.graphics.Color
import android.graphics.PixelFormat
import android.graphics.drawable.GradientDrawable
import android.os.Handler
import android.os.IBinder
import android.os.Looper
import android.view.Gravity
import android.view.MotionEvent
import android.view.WindowManager
import android.widget.FrameLayout
import android.widget.TextView
import java.util.concurrent.atomic.AtomicBoolean

class TapService : Service() {
    private var wm: WindowManager? = null
    private var view: FrameLayout? = null
    private var label: TextView? = null
    private val h = Handler(Looper.getMainLooper())
    private val on = AtomicBoolean(false)
    private var cps = 12
    private var px = 0
    private var py = 0

    override fun onBind(i: Intent?): IBinder? = null

    override fun onStartCommand(i: Intent?, f: Int, id: Int): Int {
        cps = i?.getIntExtra("cps", 12) ?: 12
        if (view == null) show()
        return START_STICKY
    }

    private fun show() {
        wm = getSystemService(WINDOW_SERVICE) as WindowManager
        val fl = FrameLayout(this)
        val tv = TextView(this).apply {
            text = "TAP"
            setTextColor(Color.WHITE)
            textSize = 13f
            gravity = Gravity.CENTER
            setPadding(28, 28, 28, 28)
            background = GradientDrawable().apply {
                shape = GradientDrawable.OVAL
                setColor(0xE0FF1744.toInt())
            }
        }
        label = tv
        fl.addView(tv, FrameLayout.LayoutParams(150, 150, Gravity.CENTER))
        val type = WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY
        val lp = WindowManager.LayoutParams(
            WindowManager.LayoutParams.WRAP_CONTENT,
            WindowManager.LayoutParams.WRAP_CONTENT,
            type,
            WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE,
            PixelFormat.TRANSLUCENT
        ).apply {
            gravity = Gravity.TOP or Gravity.START
            x = 60; y = 400
        }
        var lx = 0f; var ly = 0f; var moved = false
        fl.setOnTouchListener { v, e ->
            when (e.action) {
                MotionEvent.ACTION_DOWN -> { lx = e.rawX; ly = e.rawY; moved = false; true }
                MotionEvent.ACTION_MOVE -> {
                    val dx = (e.rawX - lx).toInt(); val dy = (e.rawY - ly).toInt()
                    if (kotlin.math.abs(dx) > 5 || kotlin.math.abs(dy) > 5) moved = true
                    lp.x += dx; lp.y += dy; lx = e.rawX; ly = e.rawY
                    try { wm?.updateViewLayout(v, lp) } catch (_: Exception) {}
                    true
                }
                MotionEvent.ACTION_UP -> { if (!moved) toggle(); true }
                else -> false
            }
        }
        view = fl
        try { wm?.addView(fl, lp) } catch (_: Exception) { stopSelf() }
    }

    private fun toggle() {
        if (on.get()) stop() else start()
    }

    private fun start() {
        if (!ShizukuHelper.available() || !ShizukuHelper.granted()) {
            label?.text = "NO SZ"; return
        }
        on.set(true)
        label?.text = "ON"
        label?.background = GradientDrawable().apply {
            shape = GradientDrawable.OVAL; setColor(0xE000E676.toInt())
        }
        val delay = (1000L / cps).coerceAtLeast(40L)
        val loop = object : Runnable {
            override fun run() {
                if (!on.get()) return
                view?.let {
                    val loc = IntArray(2)
                    it.getLocationOnScreen(loc)
                    px = loc[0] + it.width / 2
                    py = loc[1] + it.height / 2 - 10
                }
                ShizukuHelper.tap(px, py)
                h.postDelayed(this, delay)
            }
        }
        h.post(loop)
    }

    private fun stop() {
        on.set(false)
        label?.text = "TAP"
        label?.background = GradientDrawable().apply {
            shape = GradientDrawable.OVAL; setColor(0xE0FF1744.toInt())
        }
    }

    override fun onDestroy() {
        on.set(false)
        view?.let { try { wm?.removeView(it) } catch (_: Exception) {} }
        view = null
        super.onDestroy()
    }
}

__EOF__

mkdir -p "app/src/main/res/drawable"
cat > "app/src/main/res/drawable/ic_launcher.xml" <<'__EOF__'
<?xml version="1.0" encoding="utf-8"?>
<vector xmlns:android="http://schemas.android.com/apk/res/android"
    android:width="108dp" android:height="108dp"
    android:viewportWidth="108" android:viewportHeight="108">
    <path android:fillColor="#FF1744" android:pathData="M0,0h108v108h-108z"/>
    <path android:fillColor="#FFFFFF"
        android:pathData="M54,28c-10,0 -18,8 -18,18c0,8 5,14 12,17v8h12v-8c7,-3 12,-9 12,-17c0,-10 -8,-18 -18,-18zM36,78c0,-8 8,-12 18,-12s18,4 18,12v6H36v-6z"/>
</vector>

__EOF__

mkdir -p "app/src/main/res/values"
cat > "app/src/main/res/values/strings.xml" <<'__EOF__'
<resources>
    <string name="app_name">ELAINA Optimasi</string>
</resources>

__EOF__

cat > "build.gradle.kts" <<'__EOF__'
plugins {
    id("com.android.application") version "8.2.2" apply false
    id("org.jetbrains.kotlin.android") version "1.9.22" apply false
}

__EOF__

cat > "gradle.properties" <<'__EOF__'
org.gradle.jvmargs=-Xmx2048m -Dfile.encoding=UTF-8
android.useAndroidX=true
android.nonTransitiveRClass=true

__EOF__

cat > "settings.gradle.kts" <<'__EOF__'
pluginManagement {
    repositories { google(); mavenCentral(); gradlePluginPortal() }
}
dependencyResolutionManagement {
    repositoriesMode.set(RepositoriesMode.FAIL_ON_PROJECT_REPOS)
    repositories { google(); mavenCentral() }
}
rootProject.name = "ElainaOptimasi"
include(":app")

__EOF__

echo "[ELAINA] done"