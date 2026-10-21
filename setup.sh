#!/bin/bash
set -e
echo "[ELAINA] setup v1.4..."

mkdir -p app/src/main/java/com/elaina/optimasi
mkdir -p app/src/main/res/drawable app/src/main/res/values
mkdir -p .github/workflows

cat > "README.md" <<'__EOF__'
# ELAINA Optimasi v1.4

Turbo tap + crosshair editor + graphics preset + quick HUD via **Shizuku** (atau WRITE_SECURE_SETTINGS).

## Fitur
- **6 halaman**: HOME / TURBO / GRAFIK / AIM / AKTIF / INFO
- **Crosshair editor**: gambar sendiri, atur ukuran/rotasi/opacity/posisi
- **Quick HUD**: menu melayang saat main (boost, toggle crosshair, tap, close)
- **GRAFIK**: preset Smooth/Balanced/HD/Ultra + custom FPS/GPU/blur
- **AKTIF**: panduan 4 metode aktivasi (Wireless Debug, ADB PC, Root, Tanpa Shizuku)

## Build APK
Actions → Build APK → Run workflow → download artifact.
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
        versionCode = 5
        versionName = "1.4-game"
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

cat > "app/src/main/AndroidManifest.xml" <<'__EOF__'
<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:tools="http://schemas.android.com/tools">
    <uses-permission android:name="android.permission.SYSTEM_ALERT_WINDOW" />
    <uses-permission android:name="android.permission.FOREGROUND_SERVICE" />
    <uses-permission android:name="android.permission.FOREGROUND_SERVICE_SPECIAL_USE" />
    <uses-permission android:name="android.permission.POST_NOTIFICATIONS" />
    <uses-permission android:name="android.permission.WAKE_LOCK" />
    <uses-permission android:name="android.permission.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS" />
    <uses-permission android:name="android.permission.WRITE_SECURE_SETTINGS"
        tools:ignore="ProtectedPermissions" />
    <queries>
        <package android:name="moe.shizuku.privileged.api" />
    </queries>
    <application
        android:label="ELAINA Optimasi"
        android:icon="@drawable/ic_launcher"
        android:allowBackup="false"
        android:largeHeap="true"
        android:theme="@android:style/Theme.DeviceDefault.NoActionBar">
        <activity android:name=".MainActivity" android:exported="true" android:screenOrientation="portrait">
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />
                <category android:name="android.intent.category.LAUNCHER" />
            </intent-filter>
        </activity>
        <service android:name=".TapService" android:exported="false" android:foregroundServiceType="specialUse">
            <property android:name="android.app.PROPERTY_SPECIAL_USE_FGS_SUBTYPE" android:value="game turbo tap overlay" />
        </service>
        <service android:name=".CrossService" android:exported="false" android:foregroundServiceType="specialUse">
            <property android:name="android.app.PROPERTY_SPECIAL_USE_FGS_SUBTYPE" android:value="game crosshair overlay" />
        </service>
        <service android:name=".QuickHudService" android:exported="false" android:foregroundServiceType="specialUse">
            <property android:name="android.app.PROPERTY_SPECIAL_USE_FGS_SUBTYPE" android:value="in game hud overlay" />
        </service>
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

# ---------- CrossPrefs ----------
cat > "app/src/main/java/com/elaina/optimasi/CrossPrefs.kt" <<'__EOF__'
package com.elaina.optimasi

import android.content.Context

object CrossPrefs {
    private const val NAME = "cross_prefs"
    private fun p(ctx: Context) = ctx.getSharedPreferences(NAME, Context.MODE_PRIVATE)

    fun getImage(ctx: Context): String? = p(ctx).getString("image", null)
    fun setImage(ctx: Context, uri: String?) {
        p(ctx).edit().apply { if (uri == null) remove("image") else putString("image", uri) }.apply()
    }
    fun getSize(ctx: Context): Int = p(ctx).getInt("size", 90)
    fun setSize(ctx: Context, v: Int) = p(ctx).edit().putInt("size", v).apply()
    fun getRot(ctx: Context): Int = p(ctx).getInt("rot", 0)
    fun setRot(ctx: Context, v: Int) = p(ctx).edit().putInt("rot", v).apply()
    fun getOpacity(ctx: Context): Int = p(ctx).getInt("opacity", 255)
    fun setOpacity(ctx: Context, v: Int) = p(ctx).edit().putInt("opacity", v).apply()
    fun getOffX(ctx: Context): Int = p(ctx).getInt("ox", 0)
    fun setOffX(ctx: Context, v: Int) = p(ctx).edit().putInt("ox", v).apply()
    fun getOffY(ctx: Context): Int = p(ctx).getInt("oy", 0)
    fun setOffY(ctx: Context, v: Int) = p(ctx).edit().putInt("oy", v).apply()

    fun reset(ctx: Context) {
        p(ctx).edit().clear().apply()
    }
}
__EOF__

# ---------- ShizukuHelper ----------
cat > "app/src/main/java/com/elaina/optimasi/ShizukuHelper.kt" <<'__EOF__'
package com.elaina.optimasi

import android.content.Context
import android.content.pm.ApplicationInfo
import android.content.pm.PackageManager
import android.provider.Settings
import rikka.shizuku.Shizuku
import java.io.BufferedReader
import java.io.InputStreamReader

object ShizukuHelper {
    fun available(): Boolean = try { Shizuku.pingBinder() } catch (_: Exception) { false }
    fun granted(): Boolean = try {
        Shizuku.checkSelfPermission() == PackageManager.PERMISSION_GRANTED
    } catch (_: Exception) { false }

    fun hasSecureSettings(ctx: Context): Boolean = try {
        ctx.checkSelfPermission("android.permission.WRITE_SECURE_SETTINGS") == PackageManager.PERMISSION_GRANTED
    } catch (_: Exception) { false }

    fun canTweak(ctx: Context): Boolean = granted() || hasSecureSettings(ctx)

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
            val err = BufferedReader(InputStreamReader(p.errorStream)).readText()
            p.waitFor()
            val r = out.trim().ifBlank { err.trim() }
            r.ifBlank { "OK" }
        } catch (e: Exception) { "ERR:${e.message}" }
    }

    fun tap(x: Int, y: Int) = !shell("input tap $x $y").startsWith("ERR")

    // ---- RAM ----
    fun cleanRamHard(ctx: Context): Int {
        if (!granted()) return -1
        var n = 0
        val self = ctx.packageName
        val keep = setOf(
            self, "moe.shizuku.privileged.api", "com.android.systemui",
            "com.android.launcher3", "com.google.android.apps.nexuslauncher",
            "com.miui.home", "com.oppo.launcher", "com.vivo.launcher",
            "com.sec.android.app.launcher", "com.huawei.android.launcher"
        )
        try {
            val pm = ctx.packageManager
            for (ai in pm.getInstalledApplications(0)) {
                val p = ai.packageName
                if (p in keep) continue
                if (p.startsWith("android.") || p.startsWith("com.android.")) continue
                if ((ai.flags and ApplicationInfo.FLAG_SYSTEM) != 0) continue
                if (!shell("am force-stop $p").startsWith("ERR")) n++
            }
            shell("am kill-all")
            shell("cmd activity kill-all")
        } catch (_: Exception) {}
        return n
    }

    // ---- Graphics preset ----
    fun graphicsPreset(ctx: Context, preset: String) {
        when (preset) {
            "smooth" -> {
                applyGlobal(ctx, mapOf(
                    "window_animation_scale" to "0",
                    "transition_animation_scale" to "0",
                    "animator_duration_scale" to "0",
                    "force_gpu_rendering" to "1",
                    "disable_window_blurs" to "1",
                    "background_process_limit" to "2"
                ))
                applySystem(ctx, mapOf(
                    "peak_refresh_rate" to "90",
                    "min_refresh_rate" to "60"
                ))
            }
            "balanced" -> {
                applyGlobal(ctx, mapOf(
                    "window_animation_scale" to "0.5",
                    "transition_animation_scale" to "0.5",
                    "animator_duration_scale" to "0.5",
                    "force_gpu_rendering" to "0",
                    "disable_window_blurs" to "0",
                    "background_process_limit" to "-1"
                ))
                applySystem(ctx, mapOf(
                    "peak_refresh_rate" to "120",
                    "min_refresh_rate" to "60"
                ))
            }
            "hd" -> {
                applyGlobal(ctx, mapOf(
                    "window_animation_scale" to "1",
                    "transition_animation_scale" to "1",
                    "animator_duration_scale" to "1",
                    "force_gpu_rendering" to "0",
                    "disable_window_blurs" to "0"
                ))
                applySystem(ctx, mapOf(
                    "peak_refresh_rate" to "120",
                    "min_refresh_rate" to "60"
                ))
            }
            "ultra" -> {
                applyGlobal(ctx, mapOf(
                    "window_animation_scale" to "1",
                    "transition_animation_scale" to "1",
                    "animator_duration_scale" to "1",
                    "force_gpu_rendering" to "0",
                    "disable_window_blurs" to "0"
                ))
                applySystem(ctx, mapOf(
                    "peak_refresh_rate" to "144",
                    "min_refresh_rate" to "90"
                ))
            }
        }
    }

    fun graphicsCustom(ctx: Context, anim: Boolean, gpu: Boolean, blur: Boolean,
                       fps: Int, bgLimit: Int) {
        val s = if (anim) "1" else "0"
        applyGlobal(ctx, mapOf(
            "window_animation_scale" to s,
            "transition_animation_scale" to s,
            "animator_duration_scale" to s,
            "force_gpu_rendering" to (if (gpu) "1" else "0"),
            "disable_window_blurs" to (if (blur) "1" else "0"),
            "background_process_limit" to bgLimit.toString()
        ))
        applySystem(ctx, mapOf(
            "peak_refresh_rate" to fps.toString(),
            "min_refresh_rate" to "60"
        ))
    }

    private fun applyGlobal(ctx: Context, kv: Map<String, String>) {
        if (granted()) {
            kv.forEach { (k, v) -> shell("settings put global $k $v") }
        }
        if (hasSecureSettings(ctx)) {
            val cr = ctx.contentResolver
            kv.forEach { (k, v) ->
                try {
                    when (k) {
                        "window_animation_scale" -> Settings.Global.putFloat(cr, Settings.Global.WINDOW_ANIMATION_SCALE, v.toFloat())
                        "transition_animation_scale" -> Settings.Global.putFloat(cr, Settings.Global.TRANSITION_ANIMATION_SCALE, v.toFloat())
                        "animator_duration_scale" -> Settings.Global.putFloat(cr, Settings.Global.ANIMATOR_DURATION_SCALE, v.toFloat())
                        "force_gpu_rendering" -> Settings.Global.putInt(cr, "force_gpu_rendering", v.toInt())
                        "disable_window_blurs" -> Settings.Global.putInt(cr, "disable_window_blurs", v.toInt())
                    }
                } catch (_: Exception) {}
            }
        }
    }

    private fun applySystem(ctx: Context, kv: Map<String, String>) {
        if (granted()) {
            kv.forEach { (k, v) -> shell("settings put system $k $v") }
        }
    }

    // ---- Cool mode ----
    fun coolMode(ctx: Context, on: Boolean) {
        if (on) {
            applyGlobal(ctx, mapOf(
                "window_animation_scale" to "0",
                "transition_animation_scale" to "0",
                "animator_duration_scale" to "0",
                "background_process_limit" to "1",
                "forced_app_standby_enabled" to "1"
            ))
            shell("cmd thermalservice override-status 0")
            shell("am kill-all")
        } else {
            applyGlobal(ctx, mapOf(
                "window_animation_scale" to "1",
                "transition_animation_scale" to "1",
                "animator_duration_scale" to "1",
                "forced_app_standby_enabled" to "0"
            ))
            shell("cmd thermalservice reset")
        }
    }

    fun status(): String = when {
        !available() && !granted() -> "Shizuku OFF"
        available() && !granted() -> "Shizuku ON • izin belum"
        granted() -> "Shizuku SIAP ✓"
        else -> "Shizuku OFF"
    }
}
__EOF__

# ---------- CrossService ----------
cat > "app/src/main/java/com/elaina/optimasi/CrossService.kt" <<'__EOF__'
package com.elaina.optimasi

import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.app.Service
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.graphics.*
import android.graphics.drawable.BitmapDrawable
import android.net.Uri
import android.os.Build
import android.os.IBinder
import android.view.Gravity
import android.view.View
import android.view.WindowManager

class CrossService : Service() {
    companion object {
        @JvmField var running = false
        const val ACTION_REFRESH = "com.elaina.optimasi.CROSS_REFRESH"
        fun refresh(ctx: Context) {
            ctx.sendBroadcast(Intent(ACTION_REFRESH).setPackage(ctx.packageName))
        }
    }

    private var wm: WindowManager? = null
    private var view: View? = null
    private var bitmap: Bitmap? = null

    private val receiver = object : BroadcastReceiver() {
        override fun onReceive(c: Context?, i: Intent?) {
            if (i?.action == ACTION_REFRESH) rebuild()
        }
    }

    override fun onBind(i: Intent?): IBinder? = null

    override fun onStartCommand(i: Intent?, f: Int, id: Int): Int {
        if (view != null) return START_STICKY
        running = true
        startFg()
        registerReceiver(receiver, IntentFilter(ACTION_REFRESH).apply {
            if (Build.VERSION.SDK_INT >= 33) {
                // in-app only
            }
        }, if (Build.VERSION.SDK_INT >= 33) Context.RECEIVER_NOT_EXPORTED else 0)
        wm = getSystemService(WINDOW_SERVICE) as WindowManager
        buildOverlay()
        return START_STICKY
    }

    private fun loadBitmap(): Bitmap? {
        val uri = CrossPrefs.getImage(this) ?: return null
        return try {
            contentResolver.openInputStream(Uri.parse(uri))?.use {
                BitmapFactory.decodeStream(it)
            }
        } catch (_: Exception) { null }
    }

    private fun rebuild() {
        removeOverlay()
        buildOverlay()
    }

    private fun removeOverlay() {
        view?.let { try { wm?.removeView(it) } catch (_: Exception) {} }
        view = null
    }

    private fun buildOverlay() {
        val sizeDp = CrossPrefs.getSize(this)
        val rot = CrossPrefs.getRot(this).toFloat()
        val opacity = CrossPrefs.getOpacity(this)
        val ox = CrossPrefs.getOffX(this)
        val oy = CrossPrefs.getOffY(this)
        bitmap = loadBitmap()

        val density = resources.displayMetrics.density
        val sizePx = (sizeDp * density).toInt().coerceAtLeast(20)
        val containerPx = (420 * density).toInt()

        val cross = object : View(this) {
            private val stroke = Paint(Paint.ANTI_ALIAS_FLAG).apply {
                color = 0xFFFF3D00.toInt()
                style = Paint.Style.STROKE
            }
            private val dot = Paint(Paint.ANTI_ALIAS_FLAG).apply {
                color = 0xFFFFFFFF.toInt()
                style = Paint.Style.FILL
            }
            private val ring = Paint(Paint.ANTI_ALIAS_FLAG).apply {
                color = 0xAAFF1744.toInt()
                style = Paint.Style.STROKE
            }
            private val imgPaint = Paint(Paint.FILTER_BITMAP_FLAG or Paint.ANTI_ALIAS_FLAG)

            override fun onDraw(c: Canvas) {
                val cx = width / 2f
                val cy = height / 2f
                val half = sizePx / 2f
                c.save()
                c.rotate(rot, cx, cy)

                val bmp = bitmap
                if (bmp != null) {
                    imgPaint.alpha = opacity
                    // fit center preserving aspect
                    val bw = bmp.width.toFloat()
                    val bh = bmp.height.toFloat()
                    val scale = minOf(sizePx / bw, sizePx / bh)
                    val nw = bw * scale
                    val nh = bh * scale
                    val left = cx - nw / 2f
                    val top = cy - nh / 2f
                    c.drawBitmap(bmp, null, RectF(left, top, left + nw, top + nh), imgPaint)
                } else {
                    val r = half
                    val len = r * 0.88f
                    val gap = r * 0.16f
                    stroke.alpha = opacity
                    stroke.strokeWidth = (sizePx * 0.032f).coerceAtLeast(2.2f)
                    ring.alpha = (opacity * 0.55f).toInt()
                    ring.strokeWidth = (sizePx * 0.014f).coerceAtLeast(1.2f)
                    dot.alpha = opacity
                    // outer ring
                    c.drawCircle(cx, cy, r * 0.92f, ring)
                    // crosshair lines
                    c.drawLine(cx - len, cy, cx - gap, cy, stroke)
                    c.drawLine(cx + gap, cy, cx + len, cy, stroke)
                    c.drawLine(cx, cy - len, cx, cy - gap, stroke)
                    c.drawLine(cx, cy + gap, cx, cy + len, stroke)
                    // center dot
                    c.drawCircle(cx, cy, (sizePx * 0.032f).coerceAtLeast(2.4f), dot)
                }
