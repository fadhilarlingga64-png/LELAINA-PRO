#!/bin/bash
set -e
mkdir -p "app"
cat > "app/build.gradle.kts" <<'__XH_EOF__'
plugins {
    id("com.android.application")
    id("org.jetbrains.kotlin.android")
}
android {
    namespace = "com.crosshair.pro"
    compileSdk = 34
    defaultConfig {
        applicationId = "com.crosshair.pro"
        minSdk = 29
        targetSdk = 34
        versionCode = 2
        versionName = "2.0"
    }
    signingConfigs {
        getByName("debug") {
            storeFile = file("debug.keystore")
            storePassword = "android"
            keyAlias = "androiddebugkey"
            keyPassword = "android"
        }
    }
    buildTypes { release { isMinifyEnabled = false } }
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
    kotlinOptions { jvmTarget = "17" }
}
dependencies {
    implementation("dev.rikka.shizuku:api:13.1.5")
    implementation("dev.rikka.shizuku:provider:13.1.5")
}
__XH_EOF__
mkdir -p "app"
base64 -d > "app/debug.keystore" <<'__XH_B64__'
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
__XH_B64__
mkdir -p "app/src/main"
cat > "app/src/main/AndroidManifest.xml" <<'__XH_EOF__'
<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android">
    <uses-permission android:name="android.permission.SYSTEM_ALERT_WINDOW" />
    <uses-permission android:name="android.permission.FOREGROUND_SERVICE" />
    <uses-permission android:name="android.permission.FOREGROUND_SERVICE_SPECIAL_USE" />
    <uses-permission android:name="android.permission.FOREGROUND_SERVICE_MEDIA_PROJECTION" />
    <uses-permission android:name="android.permission.POST_NOTIFICATIONS" />
    <uses-permission android:name="android.permission.ACCESS_NOTIFICATION_POLICY" />
    <uses-permission android:name="android.permission.INTERNET" />
    <uses-permission android:name="android.permission.KILL_BACKGROUND_PROCESSES" />
    <uses-permission android:name="android.permission.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS" />
    <uses-permission android:name="moe.shizuku.manager.permission.API_V23" />
    <queries>
        <intent>
            <action android:name="android.intent.action.MAIN" />
            <category android:name="android.intent.category.LAUNCHER" />
        </intent>
        <package android:name="moe.shizuku.privileged.api" />
        <intent>
            <action android:name="android.intent.action.MAIN" />
            <category android:name="android.intent.category.HOME" />
        </intent>
    </queries>
    <application
        android:label="ELAINA Optimasi"
        android:icon="@mipmap/ic_launcher"
        android:roundIcon="@mipmap/ic_launcher"
        android:allowBackup="false"
        android:theme="@android:style/Theme.DeviceDefault.NoActionBar">
        <activity android:name=".MainActivity" android:exported="true">
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />
                <category android:name="android.intent.category.LAUNCHER" />
            </intent-filter>
        </activity>
        <provider
            android:name="rikka.shizuku.ShizukuProvider"
            android:authorities="${applicationId}.shizuku"
            android:enabled="true"
            android:exported="true"
            android:multiprocess="false"
            android:permission="android.permission.INTERACT_ACROSS_USERS_FULL" />
        <activity
            android:name=".HubActivity"
            android:exported="false"
            android:screenOrientation="landscape"
            android:configChanges="orientation|screenSize|keyboardHidden" />
        <service
            android:name=".OverlayService"
            android:exported="false"
            android:stopWithTask="false"
            android:foregroundServiceType="specialUse|mediaProjection">
            <property
                android:name="android.app.PROPERTY_SPECIAL_USE_FGS_SUBTYPE"
                android:value="game overlay crosshair" />
        </service>
    </application>
</manifest>
__XH_EOF__
mkdir -p "app/src/main/java/com/crosshair/pro"
cat > "app/src/main/java/com/crosshair/pro/Bg.kt" <<'__XH_EOF__'
package com.crosshair.pro

import android.graphics.Bitmap

object Bg {
    /** Returns (full-size result with transparent background, cropped result or null if empty). */
    fun process(src: Bitmap, tol: Int, feather: Int, mode: Int, bgIn: Int?): Pair<Bitmap, Bitmap?> {
        val w = src.width
        val h = src.height
        val n = w * h
        val px = IntArray(n)
        src.getPixels(px, 0, w, 0, 0, w, h)
        val bg = bgIn ?: avgBorder(px, w, h)
        val br = (bg shr 16) and 255
        val bgG = (bg shr 8) and 255
        val bb = bg and 255
        val t2 = tol * tol
        fun match(i: Int): Boolean {
            val c = px[i]
            if ((c ushr 24) < 8) return true
            val dr = ((c shr 16) and 255) - br
            val dg = ((c shr 8) and 255) - bgG
            val db = (c and 255) - bb
            return dr * dr + dg * dg + db * db <= t2
        }
        val rem = BooleanArray(n)
        if (mode == 1) {
            for (i in 0 until n) if (match(i)) rem[i] = true
        } else {
            val st = IntArray(n + 8)
            var sp = 0
            fun push(x: Int, y: Int) {
                val q = y * w + x
                if (!rem[q] && match(q)) { rem[q] = true; st[sp++] = q }
            }
            for (x in 0 until w) { push(x, 0); push(x, h - 1) }
            for (y in 0 until h) { push(0, y); push(w - 1, y) }
            while (sp > 0) {
                val q = st[--sp]
                val x = q % w
                val y = q / w
                if (x > 0) push(x - 1, y)
                if (x < w - 1) push(x + 1, y)
                if (y > 0) push(x, y - 1)
                if (y < h - 1) push(x, y + 1)
            }
        }
        val a0 = FloatArray(n) { (px[it] ushr 24).toFloat() }
        var a = FloatArray(n) { if (rem[it]) 0f else a0[it] }
        repeat(feather) {
            val b2 = FloatArray(n)
            for (y in 0 until h) for (x in 0 until w) {
                var s = 0f
                var cnt = 0
                for (oy in -1..1) {
                    val ny = y + oy
                    if (ny < 0 || ny >= h) continue
                    for (ox in -1..1) {
                        val nx = x + ox
                        if (nx < 0 || nx >= w) continue
                        s += a[ny * w + nx]
                        cnt++
                    }
                }
                b2[y * w + x] = s / cnt
            }
            val na = FloatArray(n)
            for (j in 0 until n) na[j] = if (rem[j]) b2[j] * 0.6f else minOf(a0[j], b2[j] * 1.2f)
            a = na
        }
        var minx = w; var miny = h; var maxx = -1; var maxy = -1
        val out = IntArray(n)
        for (i in 0 until n) {
            val av = a[i].toInt().coerceIn(0, 255)
            out[i] = (av shl 24) or (px[i] and 0xFFFFFF)
            if (av > 20) {
                val x = i % w
                val y = i / w
                if (x < minx) minx = x
                if (x > maxx) maxx = x
                if (y < miny) miny = y
                if (y > maxy) maxy = y
            }
        }
        val full = Bitmap.createBitmap(w, h, Bitmap.Config.ARGB_8888)
        full.setPixels(out, 0, w, 0, 0, w, h)
        val cropped = if (maxx < 0) null else Bitmap.createBitmap(full, minx, miny, maxx - minx + 1, maxy - miny + 1)
        return Pair(full, cropped)
    }

    private fun avgBorder(px: IntArray, w: Int, h: Int): Int {
        val pts = arrayOf(
            intArrayOf(0, 0), intArrayOf(w - 1, 0), intArrayOf(0, h - 1), intArrayOf(w - 1, h - 1),
            intArrayOf(w / 2, 0), intArrayOf(w / 2, h - 1), intArrayOf(0, h / 2), intArrayOf(w - 1, h / 2)
        )
        var r = 0; var g = 0; var b = 0
        for (p in pts) {
            val c = px[p[1] * w + p[0]]
            r += (c shr 16) and 255; g += (c shr 8) and 255; b += c and 255
        }
        return (0xFF shl 24) or ((r / pts.size) shl 16) or ((g / pts.size) shl 8) or (b / pts.size)
    }
}
__XH_EOF__
mkdir -p "app/src/main/java/com/crosshair/pro"
cat > "app/src/main/java/com/crosshair/pro/HubActivity.kt" <<'__XH_EOF__'
package com.crosshair.pro

import android.Manifest
import android.app.Activity
import android.app.AlertDialog
import android.content.Context
import android.content.Intent
import android.content.pm.ApplicationInfo
import android.content.pm.PackageManager
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.graphics.Canvas
import android.graphics.Color
import android.graphics.drawable.ColorDrawable
import android.graphics.Paint
import android.graphics.PorterDuff
import android.graphics.PorterDuffColorFilter
import android.graphics.RadialGradient
import android.graphics.RectF
import android.graphics.Shader
import android.graphics.Typeface
import android.media.projection.MediaProjectionManager
import android.net.Uri
import android.os.Build
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import android.provider.Settings
import android.view.Choreographer
import android.view.GestureDetector
import android.view.Gravity
import android.view.MotionEvent
import android.view.View
import android.view.WindowInsets
import android.view.WindowInsetsController
import android.view.WindowManager
import android.widget.FrameLayout
import android.widget.ImageView
import android.widget.LinearLayout
import android.widget.TextView
import android.widget.Toast

/** Intro: kelinci kuas melompat, menginjak LILI STORE, lalu kamera masuk ke mata merah kelinci (gaya dark). */
class IntroView(ctx: Context, private val leap: Bitmap, private val head: Bitmap) : View(ctx) {
    var t = 0f
    private val p = Paint(Paint.ANTI_ALIAS_FLAG)
    private val bp = Paint(Paint.FILTER_BITMAP_FLAG or Paint.ANTI_ALIAS_FLAG)
    private val rf = RectF()
    private val rnd = java.util.Random(5)
    private val sx = FloatArray(26) { rnd.nextFloat() }
    private val sw = FloatArray(26) { 0.0015f + rnd.nextFloat() * 0.008f }
    private val pa = FloatArray(44) { (Math.PI + rnd.nextDouble() * Math.PI).toFloat() }
    private val pv = FloatArray(44) { 0.35f + rnd.nextFloat() }
    private val smx = FloatArray(14) { rnd.nextFloat() }
    private val smy = FloatArray(14) { rnd.nextFloat() }
    private var vig: RadialGradient? = null

    private fun ease(x: Float) = x * x * (3 - 2 * x)
    private fun seg(a: Float, b: Float) = ((t - a) / (b - a)).coerceIn(0f, 1f)

    override fun onSizeChanged(w: Int, h: Int, ow: Int, oh: Int) {
        vig = RadialGradient(w / 2f, h / 2f, maxOf(w, h) * 0.75f, intArrayOf(0x00000000, 0xF0000000.toInt()), floatArrayOf(0.45f, 1f), Shader.TileMode.CLAMP)
    }

    private fun tint(c: Canvas, b: Bitmap, l: Float, tp: Float, r: Float, bt: Float, color: Int, a: Float) {
        bp.colorFilter = PorterDuffColorFilter(color, PorterDuff.Mode.SRC_IN)
        bp.alpha = (255 * a.coerceIn(0f, 1f)).toInt()
        rf.set(l, tp, r, bt)
        c.drawBitmap(b, null, rf, bp)
    }

    private fun leapRabbit(c: Canvas, cx: Float, feetY: Float, wid: Float, rot: Float, a: Float) {
        val hg = wid * leap.height / leap.width
        c.save()
        c.translate(cx, feetY - hg / 2)
        c.rotate(rot)
        tint(c, leap, -wid * 0.57f, -hg * 0.57f, wid * 0.57f, hg * 0.57f, C.HOT, 0.45f * a)
        tint(c, leap, -wid * 0.53f, -hg * 0.53f, wid * 0.53f, hg * 0.53f, C.RED, 0.6f * a)
        tint(c, leap, -wid / 2, -hg / 2, wid / 2, hg / 2, 0xFFF6EEFF.toInt(), a)
        c.restore()
    }

    override fun onDraw(c: Canvas) {
        val w = width.toFloat()
        val h = height.toFloat()
        c.drawColor(0xFF030204.toInt())
        val base = h * 0.84f
        val tsz = h * 0.20f
        val textTop = base - tsz * 0.72f
        val rw = h * 0.62f
        val landX = w * 0.5f
        val stompT = 0.44f
        val hs = h * 0.98f
        val hcx = w / 2
        val hcy = h * 0.5f
        val ex = hcx - hs / 2 + 0.516f * hs
        val ey = hcy - hs / 2 + 0.549f * hs

        // latar: garis cahaya dan asap merah
        p.style = Paint.Style.FILL
        val bgFade = 1f - seg(0.35f, 0.55f)
        for (i in sx.indices) {
            val a = (0.5f + 0.5f * Math.sin((t * 22f + i).toDouble()).toFloat()) * bgFade * 0.5f
            p.color = C.HOT
            p.alpha = (a * 255).toInt()
            c.drawRect(sx[i] * w, 0f, sx[i] * w + sw[i] * w, h, p)
        }
        for (i in smx.indices) {
            val yy = (((smy[i] - t * 0.35f) % 1f) + 1f) % 1f
            for (k in 0..2) {
                p.color = if (i % 3 == 0) C.RED else C.HOT
                p.alpha = 15
                c.drawCircle(smx[i] * w, yy * h, h * (0.26f - k * 0.07f), p)
            }
        }

        // ---- adegan A: kelinci melompat dan menginjak tulisan ----
        val aA = 1f - seg(0.50f, 0.58f)
        if (aA > 0f) {
            val shakeK = if (t > stompT && t < stompT + 0.07f) 1f - seg(stompT, stompT + 0.07f) else 0f
            c.save()
            c.translate((rnd.nextFloat() - 0.5f) * h * 0.03f * shakeK, (rnd.nextFloat() - 0.5f) * h * 0.03f * shakeK)
            p.style = Paint.Style.STROKE
            p.strokeWidth = 3f
            p.color = C.RED
            p.alpha = (110 * seg(0.04f, 0.14f) * aA).toInt()
            c.drawLine(0f, base + 8f, w, base + 8f, p)
            val ta = seg(0.06f, 0.18f) * aA
            if (ta > 0f) {
                val sq = if (t < stompT) 1f else if (t < stompT + 0.04f) 1f - 0.45f * seg(stompT, stompT + 0.04f) else 0.55f + 0.45f * ease(seg(stompT + 0.04f, 0.70f))
                c.save()
                c.scale(1f, sq, w / 2, base)
                p.typeface = Typeface.create("sans-serif-condensed", Typeface.BOLD_ITALIC)
                p.textAlign = Paint.Align.CENTER
                p.textSize = tsz
                p.letterSpacing = 0.06f
                val gl = if (t < 0.22f) (rnd.nextFloat() - 0.5f) * 14f else 0f
                p.style = Paint.Style.STROKE
                p.color = C.RED
                p.strokeWidth = 16f; p.alpha = (50 * ta).toInt(); c.drawText("LILI STORE", w / 2 + gl, base, p)
                p.strokeWidth = 8f; p.alpha = (120 * ta).toInt(); c.drawText("LILI STORE", w / 2 + gl, base, p)
                p.color = C.HOT
                p.strokeWidth = 3f; p.alpha = (255 * ta).toInt(); c.drawText("LILI STORE", w / 2 + gl, base, p)
                p.style = Paint.Style.FILL
                p.color = 0xFF140A22.toInt()
                p.alpha = (255 * ta).toInt()
                c.drawText("LILI STORE", w / 2 + gl, base, p)
                p.letterSpacing = 0f
                c.restore()
            }
            // kelinci kuas
            val k = seg(0.16f, stompT)
            if (t > 0.14f) {
                if (t < stompT) {
                    val peak = h * 0.34f
                    val x0 = -rw * 0.5f
                    val feet0 = base
                    for (g in 4 downTo 1) {
                        val kk = (k - g * 0.045f).coerceAtLeast(0f)
                        if (kk > 0f) {
                            val gx = x0 + (landX - x0) * kk
                            val gy = feet0 + (textTop - feet0) * kk - 4f * peak * kk * (1f - kk)
                            tint(c, leap, gx - rw / 2, gy - rw * leap.height / leap.width, gx + rw / 2, gy, C.HOT, 0.10f * (5 - g) * aA)
                        }
                    }
                    val rx = x0 + (landX - x0) * k
                    val fy = feet0 + (textTop - feet0) * k - 4f * peak * k * (1f - k)
                    leapRabbit(c, rx, fy, rw, -10f + 18f * k, aA)
                } else {
                    leapRabbit(c, landX, textTop + 6f, rw, 0f, aA)
                }
            }
            // gelombang kejut dan percikan
            if (t > stompT) {
                val wk = seg(stompT, stompT + 0.16f)
                p.style = Paint.Style.STROKE
                p.strokeWidth = 5f
                p.color = C.RED
                p.alpha = (200 * (1f - wk) * aA).toInt()
                val rr = wk * w * 0.55f
                c.drawOval(landX - rr, textTop - rr * 0.18f, landX + rr, textTop + rr * 0.18f, p)
                p.color = C.HOT
                p.alpha = (230 * (1f - wk) * aA).toInt()
                val r2 = wk * w * 0.4f
                c.drawOval(landX - r2, textTop - r2 * 0.14f, landX + r2, textTop + r2 * 0.14f, p)
                p.style = Paint.Style.FILL
                for (i in pa.indices) {
                    val d = wk * w * 0.35f * pv[i]
                    val xx = landX + Math.cos(pa[i].toDouble()).toFloat() * d
                    val yy = textTop + Math.sin(pa[i].toDouble()).toFloat() * d + wk * wk * h * 0.25f
                    p.color = if (i % 4 == 0) Color.WHITE else if (i % 2 == 0) C.RED else C.HOT
                    p.alpha = (255 * (1f - wk) * aA).toInt()
                    c.drawRect(xx, yy, xx + 6f + (i % 3) * 3f, yy + 6f + (i % 3) * 3f, p)
                }
            }
            c.restore()
        }

        // ---- adegan B: kepala kelinci, kamera masuk ke mata merah ----
        val aB = seg(0.50f, 0.60f)
        if (aB > 0f) {
            val zk = ease(seg(0.64f, 0.93f))
            val z = (1f + 0.1f * seg(0.5f, 0.64f)) + 70f * zk * zk
            p.style = Paint.Style.FILL
            p.shader = RadialGradient(w / 2, h / 2, h * 0.9f, intArrayOf(0xFF2A0716.toInt(), 0xFF030204.toInt()), null, Shader.TileMode.CLAMP)
            p.alpha = (255 * aB).toInt()
            c.drawRect(0f, 0f, w, h, p)
            p.shader = null
            c.save()
            c.translate(ex + (w / 2 - ex) * zk, ey + (h / 2 - ey) * zk)
            c.scale(z, z)
            c.translate(-ex, -ey)
            tint(c, head, hcx - hs * 0.53f, hcy - hs * 0.53f, hcx + hs * 0.53f, hcy + hs * 0.53f, C.HOT, 0.35f * aB)
            tint(c, head, hcx - hs * 0.515f, hcy - hs * 0.515f, hcx + hs * 0.515f, hcy + hs * 0.515f, C.RED, 0.5f * aB)
            tint(c, head, hcx - hs / 2, hcy - hs / 2, hcx + hs / 2, hcy + hs / 2, 0xFFF1E8FF.toInt(), aB)
            val pulse = 0.85f + 0.15f * Math.sin((t * 60f).toDouble()).toFloat()
            p.style = Paint.Style.FILL
            p.color = C.HOT
            p.alpha = (80 * aB).toInt(); c.drawCircle(ex, ey, hs * 0.05f * pulse, p)
            p.alpha = (140 * aB).toInt(); c.drawCircle(ex, ey, hs * 0.034f * pulse, p)
            p.alpha = (255 * aB).toInt(); c.drawCircle(ex, ey, hs * 0.022f, p)
            p.color = Color.BLACK
            p.alpha = (255 * aB).toInt()
            c.drawOval(ex - hs * 0.004f, ey - hs * 0.02f, ex + hs * 0.004f, ey + hs * 0.02f, p)
            c.restore()
        }

        // mata merah memenuhi layar
        val ea = seg(0.82f, 0.94f)
        if (ea > 0f) {
            p.style = Paint.Style.FILL
            p.shader = RadialGradient(w / 2, h / 2, h * 0.95f, intArrayOf(0xFFFF1A3C.toInt(), 0xFF8A0016.toInt(), 0xFF080006.toInt()), floatArrayOf(0f, 0.5f, 1f), Shader.TileMode.CLAMP)
            p.alpha = (255 * ea).toInt()
            c.drawRect(0f, 0f, w, h, p)
            p.shader = null
            p.color = Color.BLACK
            p.alpha = (255 * ea).toInt()
            c.drawOval(w / 2 - h * 0.07f, h * 0.08f, w / 2 + h * 0.07f, h * 0.92f, p)
            p.color = Color.WHITE
            p.alpha = (200 * ea).toInt()
            c.drawCircle(w / 2 - h * 0.18f, h * 0.30f, h * 0.035f, p)
            p.alpha = 255
        }

        // vignette gelap, kilatan, glitch
        p.style = Paint.Style.FILL
        p.shader = vig
        c.drawRect(0f, 0f, w, h, p)
        p.shader = null
        val flash = if (t > stompT && t < stompT + 0.08f) 1f - seg(stompT, stompT + 0.08f) else 0f
        if (flash > 0f) { p.color = Color.WHITE; p.alpha = (150 * flash).toInt(); c.drawRect(0f, 0f, w, h, p) }
        if ((t > stompT && t < stompT + 0.06f) || (t > 0.86f && t < 0.93f)) {
            for (i in 0 until 7) {
                val gy = rnd.nextFloat() * h
                p.color = if (i % 2 == 0) C.HOT else C.RED
                p.alpha = 150
                c.drawRect(rnd.nextFloat() * w * 0.2f, gy, w, gy + h * 0.012f, p)
            }
        }
        val fade = seg(0.95f, 1f)
        if (fade > 0f) { p.color = Color.BLACK; p.alpha = (255 * fade).toInt(); c.drawRect(0f, 0f, w, h, p) }
        p.alpha = 255
        p.textAlign = Paint.Align.CENTER
        p.textSize = h * 0.035f
        p.color = 0xFF9A8CB8.toInt()
        p.alpha = 150
        c.drawText("ketuk untuk lewati", w / 2, h * 0.97f, p)
        p.alpha = 255
    }
}

/** Latar layar pilih game: gradasi gelap ungu, grid halus, dan kepala kelinci samar. */
class BgView(ctx: Context, private val head: Bitmap) : View(ctx) {
    private val p = Paint(Paint.ANTI_ALIAS_FLAG)
    private val bp = Paint(Paint.FILTER_BITMAP_FLAG)
    private val rf = RectF()

    override fun onDraw(c: Canvas) {
        val w = width.toFloat()
        val h = height.toFloat()
        p.style = Paint.Style.FILL
        p.shader = RadialGradient(w * 0.25f, h * 0.45f, w * 0.7f, intArrayOf(0xFF2A1148.toInt(), 0xFF07040D.toInt()), null, Shader.TileMode.CLAMP)
        c.drawRect(0f, 0f, w, h, p)
        p.shader = null
        p.color = 0x12B77CFF
        p.strokeWidth = 1.5f
        var x = 0f
        while (x < w) { c.drawLine(x, 0f, x, h, p); x += h / 9f }
        var y = 0f
        while (y < h) { c.drawLine(0f, y, w, y, p); y += h / 9f }
        bp.colorFilter = PorterDuffColorFilter(C.RED, PorterDuff.Mode.SRC_IN)
        bp.alpha = 55
        rf.set(w - h * 1.05f, -h * 0.05f, w + h * 0.05f, h * 1.05f)
        c.drawBitmap(head, null, rf, bp)
        p.shader = RadialGradient(w / 2, h / 2, maxOf(w, h) * 0.7f, intArrayOf(0x00000000, 0xCC000000.toInt()), floatArrayOf(0.5f, 1f), Shader.TileMode.CLAMP)
        c.drawRect(0f, 0f, w, h, p)
        p.shader = null
    }
}

class HubActivity : Activity() {
    private lateinit var s: Spec
    private lateinit var root: FrameLayout
    private val hd = Handler(Looper.getMainLooper())
    private var all: List<Game> = emptyList()
    private var shown: List<Game> = emptyList()
    private var idx = 0
    private var live: Runnable? = null
    private var pending: String? = null
    private var nameT: TextView? = null
    private var iconC: ImageView? = null
    private var iconL: ImageView? = null
    private var iconR: ImageView? = null
    private var countT: TextView? = null
    private var sideL: View? = null
    private var sideR: View? = null
    private var hubReady = false
    private var done = false

    private fun bmp(id: Int): Bitmap {
        val o = BitmapFactory.Options()
        o.inScaled = false
        return BitmapFactory.decodeResource(resources, id, o)
    }

    private fun fullscreen() {
        window.setBackgroundDrawable(ColorDrawable(Color.BLACK))
        if (Build.VERSION.SDK_INT >= 28) {
            val lp = window.attributes
            lp.layoutInDisplayCutoutMode = if (Build.VERSION.SDK_INT >= 30) WindowManager.LayoutParams.LAYOUT_IN_DISPLAY_CUTOUT_MODE_ALWAYS
            else WindowManager.LayoutParams.LAYOUT_IN_DISPLAY_CUTOUT_MODE_SHORT_EDGES
            window.attributes = lp
        }
        window.addFlags(WindowManager.LayoutParams.FLAG_LAYOUT_NO_LIMITS or WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON)
        if (Build.VERSION.SDK_INT >= 30) {
            window.setDecorFitsSystemWindows(false)
            window.insetsController?.let {
                it.hide(WindowInsets.Type.systemBars())
                it.systemBarsBehavior = WindowInsetsController.BEHAVIOR_SHOW_TRANSIENT_BARS_BY_SWIPE
            }
        } else {
            @Suppress("DEPRECATION")
            window.decorView.systemUiVisibility = View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY or View.SYSTEM_UI_FLAG_HIDE_NAVIGATION or
                View.SYSTEM_UI_FLAG_FULLSCREEN or View.SYSTEM_UI_FLAG_LAYOUT_STABLE or View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION or
                View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN
        }
    }

    override fun onCreate(b: Bundle?) {
        super.onCreate(b)
        s = Spec(this)
        fullscreen()
        root = FrameLayout(this)
        root.setBackgroundColor(Color.BLACK)
        setContentView(root)
        loadGames()
        intro()
    }

    override fun onWindowFocusChanged(hasFocus: Boolean) {
        super.onWindowFocusChanged(hasFocus)
        if (hasFocus) fullscreen()
    }

    override fun onPause() {
        super.onPause()
        live?.let { hd.removeCallbacks(it) }
    }

    override fun onResume() {
        super.onResume()
        live?.let { hd.post(it) }
    }

    private fun toast(t: String) { Toast.makeText(this, t, Toast.LENGTH_LONG).show() }

    private fun intro() {
        val iv: IntroView
        try {
            iv = IntroView(this, bmp(R.drawable.rabbit_leap), bmp(R.drawable.rabbit_head))
            root.addView(iv, FrameLayout.LayoutParams(-1, -1))
        } catch (e: Throwable) { showHub(View(this)); return }
        val dur = 7000f
        SoundFx.whoosh(this)
        hd.postDelayed({ SoundFx.thud(this) }, (dur * 0.44f).toLong())
        hd.postDelayed({ SoundFx.riser(this) }, (dur * 0.62f).toLong())
        var start = 0L
        val cb = object : Choreographer.FrameCallback {
            override fun doFrame(ns: Long) {
                if (done) return
                if (start == 0L) start = ns
                val k = ((ns - start) / 1000000f) / dur
                if (k >= 1f) { iv.t = 1f; iv.invalidate(); finishIntro(iv) }
                else { iv.t = k; iv.invalidate(); Choreographer.getInstance().postFrameCallback(this) }
            }
        }
        iv.setOnClickListener { finishIntro(iv) }
        Choreographer.getInstance().postFrameCallback(cb)
    }

    private fun finishIntro(iv: View) {
        if (done) return
        done = true
        hd.removeCallbacksAndMessages(null)
        showHub(iv)
    }

    private fun fadeOut(v: View) {
        var a = 1f
        val r = object : Runnable {
            override fun run() {
                a -= 0.125f
                if (a <= 0f) { try { root.removeView(v) } catch (e: Exception) { } }
                else { v.alpha = a; hd.postDelayed(this, 40) }
            }
        }
        hd.post(r)
    }

    private fun isGame(ai: ApplicationInfo): Boolean =
        ai.category == ApplicationInfo.CATEGORY_GAME || (ai.flags and ApplicationInfo.FLAG_IS_GAME) != 0

    private fun loadGames() {
        Thread {
            try {
                val pm = packageManager
                val i = Intent(Intent.ACTION_MAIN).addCategory(Intent.CATEGORY_LAUNCHER)
                val l = pm.queryIntentActivities(i, 0).mapNotNull { ri ->
                    val ai = ri.activityInfo.applicationInfo
                    if (ai.packageName == packageName) null else Game(ai.packageName, ri.loadLabel(pm).toString(), ri.loadIcon(pm), isGame(ai))
                }.distinctBy { it.pkg }.sortedBy { it.name.lowercase() }
                runOnUiThread { all = l; refreshShown() }
            } catch (e: Exception) { }
        }.start()
    }

    private fun refreshShown() {
        val pins = s.pins()
        shown = all.filter { it.isGame || pins.contains(it.pkg) }
        if (idx >= shown.size) idx = 0
        showGame()
    }

    private fun showGame() {
        if (!hubReady) return
        val g = shown.getOrNull(idx)
        if (g == null) {
            nameT?.text = if (all.isEmpty()) "Memuat..." else "Belum ada game"
            iconC?.setImageDrawable(null)
            countT?.text = if (all.isEmpty()) "" else "Ketuk + GAME untuk menambah"
            sideL?.visibility = View.INVISIBLE
            sideR?.visibility = View.INVISIBLE
            return
        }
        nameT?.text = g.name
        iconC?.setImageDrawable(g.icon)
        countT?.text = "" + (idx + 1) + " / " + shown.size
        val multi = shown.size > 1
        sideL?.visibility = if (multi) View.VISIBLE else View.INVISIBLE
        sideR?.visibility = if (multi) View.VISIBLE else View.INVISIBLE
        if (multi) {
            iconL?.setImageDrawable(shown[(idx - 1 + shown.size) % shown.size].icon)
            iconR?.setImageDrawable(shown[(idx + 1) % shown.size].icon)
        }
    }

    private fun step(d: Int) {
        if (shown.isEmpty()) return
        idx = (idx + d + shown.size) % shown.size
        SoundFx.click(this)
        showGame()
    }

    private fun showHub(iv: View) {
        try { buildHub(iv) } catch (e: Throwable) {
            root.removeAllViews()
            val t = label("Terjadi masalah saat membuka menu game:\n" + e + "\n\nKirim screenshot ini ke developer. Ketuk layar untuk keluar.", 14f, Color.WHITE, true)
            t.setPadding(dp(24), dp(24), dp(24), dp(24))
            t.setOnClickListener { finish() }
            root.addView(t)
        }
    }

    private fun sideCard(onClick: () -> Unit): Pair<LinearLayout, ImageView> {
        val c = LinearLayout(this)
        c.gravity = Gravity.CENTER
        c.setPadding(dp(10), dp(10), dp(10), dp(10))
        c.background = Chamfer(0x55140A22, C.LINE, dp(10).toFloat())
        c.alpha = 0.55f
        val ic = ImageView(this)
        ic.scaleType = ImageView.ScaleType.CENTER_CROP
        c.addView(ic, LinearLayout.LayoutParams(dp(64), dp(64)))
        c.setOnClickListener { onClick() }
        return Pair(c, ic)
    }

    private fun statBox(title: String): Pair<LinearLayout, TextView> {
        val b = LinearLayout(this)
        b.orientation = LinearLayout.VERTICAL
        b.gravity = Gravity.CENTER
        b.addView(label(title, 10f, C.MUTE, true))
        val v = label("--", 16f, Color.WHITE, true, true)
        b.addView(v)
        return Pair(b, v)
    }

    private fun buildHub(iv: View) {
        SoundFx.ready(this)
        val cut = root.rootWindowInsets?.displayCutout
        val padL = maxOf(dp(28), cut?.safeInsetLeft ?: 0)
        val padR = maxOf(dp(28), cut?.safeInsetRight ?: 0)
        val hub = FrameLayout(this)
        hub.addView(BgView(this, bmp(R.drawable.rabbit_head)), FrameLayout.LayoutParams(-1, -1))

        val col = LinearLayout(this)
        col.orientation = LinearLayout.VERTICAL
        col.setPadding(padL, dp(14), padR, dp(14))

        // atas: logo, tambah game, keluar
        val top = LinearLayout(this)
        top.gravity = Gravity.CENTER_VERTICAL
        val av = ShapeImageView(this, s)
        av.setImageResource(R.drawable.elaina)
        top.addView(av, LinearLayout.LayoutParams(dp(44), dp(44)))
        val tc = LinearLayout(this)
        tc.orientation = LinearLayout.VERTICAL
        tc.setPadding(dp(10), 0, 0, 0)
        val l1 = label("ELAINA", 22f, Color.WHITE, true, true)
        l1.setShadowLayer(14f, 0f, 0f, C.RED)
        tc.addView(l1)
        tc.addView(label("P R O J E K", 10f, C.HOT, true))
        top.addView(tc, LinearLayout.LayoutParams(0, -2, 1f))
        val add = label("+ GAME", 12f, C.TEXT, true)
        add.setPadding(dp(14), dp(9), dp(14), dp(9))
        add.background = Chamfer(C.PANEL2, C.LINE, dp(8).toFloat())
        add.setOnClickListener { SoundFx.click(this); pickGames() }
        top.addView(add)
        val ex = label("KELUAR", 12f, C.TEXT, true)
        ex.setPadding(dp(14), dp(9), dp(14), dp(9))
        ex.background = Chamfer(C.PANEL2, C.LINE, dp(8).toFloat())
        ex.setOnClickListener { SoundFx.click(this); finish() }
        top.addView(ex, lp(-2, -2, 0).also { it.leftMargin = dp(8) })
        col.addView(top)

        // tengah: carousel game
        val row = LinearLayout(this)
        row.gravity = Gravity.CENTER
        val sl = sideCard { step(-1) }
        val sr = sideCard { step(1) }
        sideL = sl.first; sideR = sr.first; iconL = sl.second; iconR = sr.second
        val center = LinearLayout(this)
        center.orientation = LinearLayout.VERTICAL
        center.gravity = Gravity.CENTER
        center.setPadding(dp(30), dp(18), dp(30), dp(18))
        center.background = Chamfer(0x77140A22, 0xAAC9A6FF.toInt(), dp(22).toFloat(), 3f)
        val ic = ImageView(this)
        ic.scaleType = ImageView.ScaleType.CENTER_CROP
        iconC = ic
        center.addView(ic, LinearLayout.LayoutParams(dp(104), dp(104)))
        val nm = label("", 22f, Color.WHITE, true, true)
        nm.gravity = Gravity.CENTER
        nm.maxLines = 2
        nameT = nm
        center.addView(nm, lp(-2, -2, 10))
        val cnt = label("", 12f, C.MUTE, true)
        cnt.gravity = Gravity.CENTER
        countT = cnt
        center.addView(cnt, lp(-2, -2, 2))
        row.addView(sl.first, lp(-2, -2, 0).also { it.rightMargin = dp(18) })
        row.addView(center, lp(dp(280), -2, 0))
        row.addView(sr.first, lp(-2, -2, 0).also { it.leftMargin = dp(18) })
        val gd = GestureDetector(this, object : GestureDetector.SimpleOnGestureListener() {
            override fun onFling(a: MotionEvent?, b: MotionEvent, vx: Float, vy: Float): Boolean {
                if (Math.abs(vx) > 600f) { step(if (vx < 0) 1 else -1); return true }
                return false
            }
            override fun onDown(e: MotionEvent): Boolean = true
        })
        row.setOnTouchListener { _, e -> gd.onTouchEvent(e); false }
        center.setOnTouchListener { _, e -> gd.onTouchEvent(e); true }
        col.addView(row, LinearLayout.LayoutParams(-1, 0, 1f))

        // tombol LUNCURKAN
        val go = label("LUNCURKAN", 18f, Color.WHITE, true, true)
        go.gravity = Gravity.CENTER
        go.setPadding(dp(40), dp(13), dp(40), dp(13))
        go.background = Chamfer(C.RED, C.HOT, dp(14).toFloat(), 3f)
        go.setOnClickListener { SoundFx.click(this); val g = shown.getOrNull(idx); if (g != null) play(g) else toast("Pilih atau tambah game dulu.") }
        col.addView(go, LinearLayout.LayoutParams(-2, -2).also { it.gravity = Gravity.CENTER_HORIZONTAL; it.bottomMargin = dp(12) })

        // bawah: strip info CPU, suhu, RAM, ping, baterai, jam
        val strip = LinearLayout(this)
        strip.gravity = Gravity.CENTER_VERTICAL
        strip.setPadding(dp(12), dp(8), dp(12), dp(8))
        strip.background = Chamfer(0x99100A1C, C.LINE, dp(12).toFloat())
        val sCpu = statBox("CPU"); val sTemp = statBox("SUHU"); val sRam = statBox("RAM")
        val sPing = statBox("PING"); val sBat = statBox("BATERAI"); val sClk = statBox("JAM")
        for (b in listOf(sCpu, sTemp, sRam, sPing, sBat, sClk)) strip.addView(b.first, LinearLayout.LayoutParams(0, -2, 1f))
        col.addView(strip, LinearLayout.LayoutParams(-1, -2))
        hub.addView(col, FrameLayout.LayoutParams(-1, -1))

        live = object : Runnable {
            override fun run() {
                Stats.pollCpu()
                val cpu = Stats.cpu()
                sCpu.second.text = cpu.substringAfter("•").trim().ifEmpty { cpu }.replace("  •  ", " ")
                val (bp, bt) = Stats.battery(this@HubActivity)
                sTemp.second.text = "%.1f".format(bt) + "°C"
                sBat.second.text = "$bp%"
                val (u, t2, pr) = Stats.ram(this@HubActivity)
                sRam.second.text = "$pr%"
                sClk.second.text = java.text.SimpleDateFormat("HH:mm", java.util.Locale.getDefault()).format(java.util.Date())
                Stats.ping { ms -> sPing.second.text = if (ms < 0) "--" else "$ms ms" }
                hd.postDelayed(this, 2000)
            }
        }
        live?.run()

        root.addView(hub, FrameLayout.LayoutParams(-1, -1))
        hubReady = true
        showGame()
        fadeOut(iv)
    }

    private fun pickGames() {
        if (all.isEmpty()) { toast("Daftar aplikasi belum siap."); return }
        val names = all.map { it.name }.toTypedArray()
        val pins = s.pins()
        val chk = BooleanArray(all.size) { pins.contains(all[it].pkg) }
        AlertDialog.Builder(this).setTitle("Pilih game")
            .setMultiChoiceItems(names, chk) { _, w, c -> chk[w] = c }
            .setPositiveButton("Simpan") { _, _ ->
                val np = HashSet<String>()
                for (k in chk.indices) if (chk[k]) np.add(all[k].pkg)
                s.setPins(np)
                refreshShown()
            }
            .setNegativeButton("Batal", null).show()
    }

    private fun play(g: Game) {
        if (!Settings.canDrawOverlays(this)) {
            toast("Aktifkan izin Tampil di atas aplikasi lain untuk ELAINA, lalu kembali dan tekan LUNCURKAN lagi.")
            startActivity(Intent(Settings.ACTION_MANAGE_OVERLAY_PERMISSION, Uri.parse("package:$packageName")))
            return
        }
        if (Build.VERSION.SDK_INT >= 33 && checkSelfPermission(Manifest.permission.POST_NOTIFICATIONS) != PackageManager.PERMISSION_GRANTED) {
            requestPermissions(arrayOf(Manifest.permission.POST_NOTIFICATIONS), 1)
        }
        pending = g.pkg
        if (s.b("shot") && !Shz.ready()) {
            try {
                val mpm = getSystemService(MediaProjectionManager::class.java)
                startActivityForResult(mpm.createScreenCaptureIntent(), 77)
                return
            } catch (e: Exception) { }
        }
        go(g.pkg, null, 0)
    }

    @Deprecated("Deprecated in Java")
    override fun onActivityResult(rc: Int, res: Int, d: Intent?) {
        super.onActivityResult(rc, res, d)
        val p = pending
        if (rc == 77 && p != null) go(p, if (res == RESULT_OK) d else null, res)
    }

    private fun go(pkg: String, data: Intent?, code: Int) {
        SoundFx.whoosh(this)
        if (Shz.ready()) {
            val app = applicationContext
            val sp = s
            Thread { Opt.apply(app, sp, pkg) }.start()
        }
        val i = Intent(this, OverlayService::class.java)
        if (data != null) { i.putExtra("code", code); i.putExtra("data", data) }
        try { startForegroundService(i) } catch (e: Exception) { toast("Gagal menyalakan Game Turbo."); return }
        hd.postDelayed({
            val li = packageManager.getLaunchIntentForPackage(pkg)
            if (li != null) { startActivity(li); finish() } else toast("Game tidak bisa dibuka.")
        }, 700)
    }
}
__XH_EOF__
mkdir -p "app/src/main/java/com/crosshair/pro"
cat > "app/src/main/java/com/crosshair/pro/Injector.kt" <<'__XH_EOF__'
package com.crosshair.pro

import android.os.IBinder
import android.os.SystemClock
import android.view.InputDevice
import android.view.InputEvent
import android.view.MotionEvent
import java.lang.reflect.Method
import java.util.concurrent.ConcurrentHashMap
import java.util.concurrent.atomic.AtomicBoolean

/**
 * Dijalankan lewat Shizuku: CLASSPATH=base.apk app_process /system/bin com.crosshair.pro.Injector
 * Perintah (satu per baris di stdin):
 *   S id x y cps -> mulai mengetuk (cps 0 = secepat mungkin)   E id -> berhenti
 *   T x y        -> satu ketukan                                Q    -> keluar
 */
object Injector {
    private var im: Any? = null
    private var inject: Method? = null
    private val flags = ConcurrentHashMap<Int, AtomicBoolean>()

    private fun resolve() {
        val it = Int::class.javaPrimitiveType
        var err = ""
        for (name in arrayOf("android.hardware.input.InputManager", "android.hardware.input.InputManagerGlobal")) {
            try {
                val cls = Class.forName(name)
                val o = cls.getDeclaredMethod("getInstance").invoke(null)
                val m = cls.getMethod("injectInputEvent", InputEvent::class.java, it)
                im = o; inject = m
                return
            } catch (e: Throwable) { err += name.substringAfterLast('.') + ": " + e + "; " }
        }
        try {
            val sm = Class.forName("android.os.ServiceManager")
            val binder = sm.getMethod("getService", String::class.java).invoke(null, "input") as IBinder
            val stub = Class.forName("android.hardware.input.IInputManager\$Stub")
            val o = stub.getMethod("asInterface", IBinder::class.java).invoke(null, binder)
            val m = o!!.javaClass.getMethod("injectInputEvent", InputEvent::class.java, it)
            im = o; inject = m
            return
        } catch (e: Throwable) { err += "IInputManager: " + e }
        throw RuntimeException(err)
    }

    @JvmStatic
    fun main(args: Array<String>) {
        try {
            resolve()
            println("READY")
            System.out.flush()
            val br = System.`in`.bufferedReader()
            while (true) {
                val line = br.readLine() ?: break
                val p = line.trim().split(" ")
                if (p[0] == "Q") break
                try {
                    when (p[0]) {
                        "S" -> start(p[1].toInt(), p[2].toInt(), p[3].toInt(), p[4].toInt())
                        "E" -> stop(p[1].toInt())
                        "T" -> tap(p[1].toInt(), p[2].toInt())
                    }
                } catch (e: Throwable) {
                    println("ERR " + e)
                    System.out.flush()
                }
            }
        } catch (e: Throwable) {
            println("ERR " + e)
            System.out.flush()
        }
        System.exit(0)
    }

    private fun send(action: Int, downTime: Long, x: Float, y: Float) {
        val props = arrayOf(MotionEvent.PointerProperties())
        props[0].id = 0
        props[0].toolType = MotionEvent.TOOL_TYPE_FINGER
        val coords = arrayOf(MotionEvent.PointerCoords())
        coords[0].x = x
        coords[0].y = y
        coords[0].pressure = 1f
        coords[0].size = 1f
        val now = SystemClock.uptimeMillis()
        val ev = MotionEvent.obtain(downTime, now, action, 1, props, coords, 0, 0, 1f, 1f, -1, 0, InputDevice.SOURCE_TOUCHSCREEN, 0)
        inject!!.invoke(im, ev, 0)
        ev.recycle()
    }

    private fun tap(x: Int, y: Int) {
        val t0 = SystemClock.uptimeMillis()
        send(MotionEvent.ACTION_DOWN, t0, x.toFloat(), y.toFloat())
        Thread.sleep(20)
        send(MotionEvent.ACTION_UP, t0, x.toFloat(), y.toFloat())
    }

    private fun start(id: Int, x: Int, y: Int, cps: Int) {
        stop(id)
        val f = AtomicBoolean(true)
        flags[id] = f
        val t = Thread {
            val period = if (cps > 0) 1000L / cps else 0L
            val press = if (cps in 1..8) 25L else 8L
            while (f.get()) {
                val t0 = SystemClock.uptimeMillis()
                try {
                    send(MotionEvent.ACTION_DOWN, t0, x.toFloat(), y.toFloat())
                    Thread.sleep(press)
                    send(MotionEvent.ACTION_UP, t0, x.toFloat(), y.toFloat())
                } catch (e: Throwable) {
                    println("ERR " + e)
                    System.out.flush()
                    break
                }
                val rest = if (cps > 0) period - (SystemClock.uptimeMillis() - t0) else 8L
                if (rest > 0) {
                    try { Thread.sleep(rest) } catch (e: Throwable) { break }
                }
            }
        }
        t.isDaemon = true
        t.start()
    }

    private fun stop(id: Int) {
        flags.remove(id)?.set(false)
    }
}
__XH_EOF__
mkdir -p "app/src/main/java/com/crosshair/pro"
cat > "app/src/main/java/com/crosshair/pro/Keymap.kt" <<'__XH_EOF__'
package com.crosshair.pro

import android.content.Context
import android.graphics.Canvas
import android.graphics.Color
import android.graphics.Paint
import android.graphics.PixelFormat
import android.graphics.drawable.GradientDrawable
import android.os.Handler
import android.os.Looper
import android.util.DisplayMetrics
import android.view.Gravity
import android.view.MotionEvent
import android.view.View
import android.view.WindowManager
import android.widget.LinearLayout
import android.widget.TextView
import android.widget.Toast
import org.json.JSONArray
import org.json.JSONObject
import java.util.concurrent.locks.ReentrantLock

class KmItem(var name: String, var mode: Int, var spd: Int, var hx: Int, var hy: Int, var tx: Int, var ty: Int, var trig: Int = 0)

object Km {
    val SPD = listOf("Biasa", "Sedang", "Cepat", "Gila")
    val CPS = intArrayOf(5, 10, 20, 0)
    val TRIG = listOf("Layar", "Vol -", "Vol +")
    private fun prefs(c: Context) = c.getSharedPreferences("xh_km", Context.MODE_PRIVATE)

    fun load(c: Context): MutableList<KmItem> {
        val out = ArrayList<KmItem>()
        try {
            val a = JSONArray(prefs(c).getString("km", "[]") ?: "[]")
            for (i in 0 until a.length()) {
                val o = a.getJSONObject(i)
                out.add(KmItem(o.optString("n", "A"), o.optInt("m", 0), o.optInt("s", 2),
                    o.optInt("hx", 850), o.optInt("hy", 600), o.optInt("tx", 700), o.optInt("ty", 500), o.optInt("t", 0)))
            }
        } catch (e: Exception) { }
        return out
    }

    fun save(c: Context, l: List<KmItem>) {
        val a = JSONArray()
        for (k in l) {
            val o = JSONObject()
            o.put("n", k.name); o.put("m", k.mode); o.put("s", k.spd); o.put("t", k.trig)
            o.put("hx", k.hx); o.put("hy", k.hy); o.put("tx", k.tx); o.put("ty", k.ty)
            a.put(o)
        }
        prefs(c).edit().putString("km", a.toString()).apply()
    }

    fun newItem(n: Int): KmItem {
        val i = n.coerceIn(0, 5)
        return KmItem("ABCDEF"[i].toString(), 0, 2, 880, 300 + i * 110, 650, 250 + i * 110, 0)
    }

    fun rename(l: MutableList<KmItem>) {
        for (i in l.indices) l[i].name = "ABCDEF"[i.coerceIn(0, 5)].toString()
    }
}

/** Mesin cadangan: `input tap` berulang lewat shell Shizuku. */
class TapJob {
    @Volatile var x = 0
    @Volatile var y = 0
    @Volatile var cps = 5
    @Volatile private var running = false
    @Volatile private var alive = true
    private var started = false
    private val lock = ReentrantLock()
    private val cond = lock.newCondition()
    private val procs = ArrayList<Process>()

    fun setRunning(r: Boolean) {
        if (r && !started) {
            started = true
            val n = if (cps == 0) 3 else 1
            for (i in 0 until n) Thread { worker() }.start()
        }
        lock.lock()
        try { running = r; cond.signalAll() } finally { lock.unlock() }
    }

    private fun worker() {
        var pr: Process? = null
        try {
            val p = Shz.proc(arrayOf("sh"))
            pr = p
            synchronized(procs) { procs.add(p) }
            val w = p.outputStream
            val r = p.inputStream.bufferedReader()
            w.write("exec 2>/dev/null\n".toByteArray())
            w.flush()
            while (alive) {
                lock.lock()
                try { while (alive && !running) cond.await() } finally { lock.unlock() }
                if (!alive) break
                val t0 = System.currentTimeMillis()
                w.write(("input tap " + x + " " + y + "; echo k\n").toByteArray())
                w.flush()
                if (r.readLine() == null) break
                val c = cps
                if (c > 0) {
                    val d = 1000L / c - (System.currentTimeMillis() - t0)
                    if (d > 0) Thread.sleep(d)
                }
            }
        } catch (e: Throwable) { }
        try { pr?.destroy() } catch (e: Throwable) { }
    }

    fun shutdown() {
        alive = false
        lock.lock()
        try { running = false; cond.signalAll() } finally { lock.unlock() }
        synchronized(procs) {
            for (p in procs) { try { p.destroy() } catch (e: Throwable) { } }
            procs.clear()
        }
    }
}

/** Mesin ketuk: injector cepat (app_process lewat Shizuku) dengan cadangan `input tap`. */
object Tap {
    @Volatile var label = "Belum aktif"
    @Volatile var fast = false
    @Volatile var lastErr = ""
    private var proc: Process? = null
    private var out: java.io.OutputStream? = null
    private val jobs = HashMap<Int, TapJob>()

    /** Blocking (maks sekitar 5 detik). eng: 0 otomatis, 1 cepat saja, 2 standar saja. */
    fun ensure(c: Context, eng: Int): Boolean {
        if (!Shz.ready()) { label = "Shizuku belum terhubung"; return false }
        if (eng == 2) { label = "STANDAR (input tap)"; return true }
        if (fast) return true
        startInjector(c)
        if (fast) return true
        if (eng == 1) { label = "Injector gagal: " + lastErr; return false }
        label = "STANDAR (injector gagal: " + lastErr + ")"
        return true
    }

    @Synchronized
    private fun startInjector(c: Context) {
        if (fast) return
        try {
            val apk = c.applicationInfo.sourceDir
            val cmd = "CLASSPATH='" + apk + "' exec app_process /system/bin com.crosshair.pro.Injector 2>&1"
            val p = Shz.proc(arrayOf("sh", "-c", cmd))
            proc = p
            out = p.outputStream
            val timer = Thread {
                try { Thread.sleep(5000) } catch (e: Exception) { }
                if (!fast) { try { p.destroy() } catch (e: Throwable) { } }
            }
            timer.isDaemon = true
            timer.start()
            val r = p.inputStream.bufferedReader()
            val first = r.readLine()
            if (first == "READY") {
                fast = true
                label = "CEPAT (injector)"
                val rd = Thread {
                    try {
                        while (true) {
                            val l = r.readLine() ?: break
                            if (l.startsWith("ERR")) lastErr = l
                        }
                    } catch (e: Throwable) { }
                    fast = false
                    out = null
                }
                rd.isDaemon = true
                rd.start()
            } else {
                lastErr = first ?: "tidak ada respons"
                out = null
                proc = null
            }
        } catch (e: Throwable) {
            lastErr = e.message ?: "error"
            out = null
            proc = null
        }
    }

    private fun send(line: String) {
        val o = out ?: return
        try { synchronized(this) { o.write((line + "\n").toByteArray()); o.flush() } } catch (e: Throwable) { fast = false }
    }

    fun start(id: Int, x: Int, y: Int, cps: Int) {
        if (fast) { send("S $id $x $y $cps"); return }
        val j = synchronized(jobs) { jobs.getOrPut(id) { TapJob() } }
        j.x = x; j.y = y; j.cps = cps
        j.setRunning(true)
    }

    fun stop(id: Int) {
        if (fast) send("E $id")
        val j = synchronized(jobs) { jobs[id] }
        j?.setRunning(false)
    }

    fun tap(x: Int, y: Int): Boolean {
        if (fast) { send("T $x $y"); return true }
        return !Shz.exec("input tap $x $y").startsWith("ERR")
    }

    fun shutdown() {
        send("Q")
        try { proc?.destroy() } catch (e: Throwable) { }
        fast = false
        out = null
        proc = null
        synchronized(jobs) { for (j in jobs.values) j.shutdown(); jobs.clear() }
        label = "Belum aktif"
    }
}

/** Membaca tombol volume fisik lewat getevent (Shizuku) sebagai pemicu tanpa menyentuh layar. */
object KeyWatch {
    @Volatile var active = false
    private var proc: Process? = null

    fun start(onKey: (String, Boolean) -> Unit) {
        if (active || !Shz.ready()) return
        active = true
        Thread {
            try {
                val p = Shz.proc(arrayOf("sh", "-c", "getevent -l 2>&1"))
                proc = p
                val r = p.inputStream.bufferedReader()
                while (active) {
                    val l = r.readLine() ?: break
                    val t = l.trim().split(Regex("\\s+"))
                    val st = t.lastOrNull()
                    if (t.contains("KEY_VOLUMEDOWN")) onKey("VD", st == "DOWN")
                    else if (t.contains("KEY_VOLUMEUP")) onKey("VU", st == "DOWN")
                }
            } catch (e: Throwable) { }
            active = false
        }.start()
    }

    fun stop() {
        active = false
        try { proc?.destroy() } catch (e: Throwable) { }
        proc = null
    }
}

/** Papan uji: menghitung ketukan yang benar-benar masuk. */
class PadView(ctx: Context) : View(ctx) {
    @Volatile var count = 0
    var msg = "Papan uji ketukan"
    private val p = Paint(Paint.ANTI_ALIAS_FLAG)
    fun reset() { count = 0 }
    override fun onTouchEvent(e: MotionEvent): Boolean {
        if (e.actionMasked == MotionEvent.ACTION_DOWN) { count++; invalidate() }
        return true
    }
    override fun onDraw(c: Canvas) {
        p.style = Paint.Style.FILL
        p.color = 0xFF1B1B27.toInt()
        c.drawRect(0f, 0f, width.toFloat(), height.toFloat(), p)
        p.style = Paint.Style.STROKE
        p.strokeWidth = 4f
        p.color = C.RED
        c.drawRect(2f, 2f, width - 2f, height - 2f, p)
        p.style = Paint.Style.FILL
        p.color = Color.WHITE
        p.textSize = 22f * resources.displayMetrics.density / 2f
        p.textAlign = Paint.Align.CENTER
        c.drawText("Masuk: $count ketukan", width / 2f, height / 2f - 8f, p)
        p.color = C.MUTE
        p.textSize = 14f * resources.displayMetrics.density / 2f
        c.drawText(msg, width / 2f, height / 2f + 28f, p)
    }
}

/** Tombol keymap melayang + editor langsung di dalam game. */
class KeyLayer(private val c: Context, private val wm: WindowManager, private val scr: () -> DisplayMetrics) {
    private class PV(val m: KmItem, val id: Int) {
        var hold: TextView? = null
        var mark: TextView? = null
        var hlp: WindowManager.LayoutParams? = null
        var mlp: WindowManager.LayoutParams? = null
        var on = false
    }

    private val list = ArrayList<PV>()
    private val mh = Handler(Looper.getMainLooper())
    private var nextId = 1
    private var sel: PV? = null
    var shown = false
        private set
    var edit = false
        private set
    var onEditChange: (() -> Unit)? = null
    private var bar: LinearLayout? = null
    private var barLp: WindowManager.LayoutParams? = null
    private var barTop = true
    private var selT: TextView? = null
    private val painters = ArrayList<() -> Unit>()
    private val base = WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE or
        WindowManager.LayoutParams.FLAG_LAYOUT_NO_LIMITS or WindowManager.LayoutParams.FLAG_SPLIT_TOUCH
    private val hs: Int get() = c.dp(60)
    private val ms: Int get() = c.dp(44)

    private fun toast(t: String) { Toast.makeText(c, t, Toast.LENGTH_SHORT).show() }

    // ---------- siklus hidup ----------
    fun show() {
        if (shown) return
        edit = false
        for (m in Km.load(c)) { val pv = PV(m, nextId++); build(pv); list.add(pv) }
        sel = null
        shown = true
        if (Shz.ready()) {
            val app = c.applicationContext
            val eng = Spec(app).i("kmEng")
            Thread { Tap.ensure(app, eng) }.start()
        }
        updateWatch()
    }

    fun hide() {
        closeBar()
        for (pv in list) {
            Tap.stop(pv.id)
            removeHold(pv)
            try { pv.mark?.let { wm.removeViewImmediate(it) } } catch (e: Exception) { }
        }
        list.clear()
        sel = null
        shown = false
        edit = false
        KeyWatch.stop()
    }

    fun reload() {
        val e = edit
        hide()
        show()
        if (e) setEdit(true)
    }

    fun relayout() {
        val dm = scr()
        for (pv in list) {
            place(pv.hlp, pv.m.hx, pv.m.hy, hs, dm)
            place(pv.mlp, pv.m.tx, pv.m.ty, ms, dm)
            try { pv.hold?.let { v -> pv.hlp?.let { wm.updateViewLayout(v, it) } } } catch (e: Exception) { }
            try { pv.mark?.let { v -> pv.mlp?.let { wm.updateViewLayout(v, it) } } } catch (e: Exception) { }
        }
    }

    fun vis(v: Boolean) {
        val vv = if (v) View.VISIBLE else View.INVISIBLE
        for (pv in list) { pv.hold?.visibility = vv; pv.mark?.visibility = vv }
        bar?.visibility = vv
    }

    fun isAttached(): Boolean {
        for (pv in list) {
            val a = pv.mark
            if (a != null && !a.isAttachedToWindow) return false
        }
        return true
    }

    fun setEdit(b: Boolean) {
        edit = b
        for (pv in list) {
            setOn(pv, false)
            applyMarkFlags(pv)
        }
        if (b) {
            if (sel == null) sel = list.firstOrNull()
            openBar()
        } else {
            closeBar()
        }
        paintAll()
        onEditChange?.invoke()
    }

    // ---------- pemicu volume ----------
    private fun updateWatch() {
        if (list.any { it.m.trig != 0 }) {
            KeyWatch.start { code, down -> mh.post { onKey(code, down) } }
        } else {
            KeyWatch.stop()
        }
    }

    private fun onKey(code: String, down: Boolean) {
        if (edit) return
        val want = if (code == "VD") 1 else 2
        for (pv in list) {
            if (pv.m.trig != want) continue
            if (pv.m.mode == 0) setOn(pv, down) else if (down) setOn(pv, !pv.on)
        }
    }

    // ---------- tombol ----------
    private fun place(lp: WindowManager.LayoutParams?, fx: Int, fy: Int, size: Int, dm: DisplayMetrics) {
        if (lp == null) return
        lp.x = (fx / 1000f * dm.widthPixels - size / 2f).toInt()
        lp.y = (fy / 1000f * dm.heightPixels - size / 2f).toInt()
    }

    private fun newLp(size: Int, flags: Int): WindowManager.LayoutParams {
        val lp = WindowManager.LayoutParams(size, size, WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY, flags, PixelFormat.TRANSLUCENT)
        lp.gravity = Gravity.TOP or Gravity.START
        return lp
    }

    private fun markFlags(): Int = if (edit) base else base or WindowManager.LayoutParams.FLAG_NOT_TOUCHABLE

    private fun applyMarkFlags(pv: PV) {
        val ml = pv.mlp
        val k = pv.mark
        if (ml != null && k != null) {
            ml.flags = markFlags()
            ml.alpha = if (edit) 0.95f else 0.55f
            try { wm.updateViewLayout(k, ml) } catch (e: Exception) { }
        }
    }

    private fun addHold(pv: PV) {
        if (pv.hold != null) return
        try {
            val dm = scr()
            val h = c.label(pv.m.name, 20f, Color.WHITE, true, true)
            h.gravity = Gravity.CENTER
            val hl = newLp(hs, base)
            place(hl, pv.m.hx, pv.m.hy, hs, dm)
            pv.hold = h; pv.hlp = hl
            h.setOnTouchListener(touch(pv, true))
            paint(pv)
            wm.addView(h, hl)
        } catch (e: Exception) { pv.hold = null; pv.hlp = null }
    }

    private fun removeHold(pv: PV) {
        try { pv.hold?.let { wm.removeViewImmediate(it) } } catch (e: Exception) { }
        pv.hold = null
        pv.hlp = null
    }

    private fun build(pv: PV) {
        try {
            val dm = scr()
            val k = c.label(pv.m.name, 13f, Color.WHITE, true)
            k.gravity = Gravity.CENTER
            val ml = newLp(ms, markFlags())
            ml.alpha = if (edit) 0.95f else 0.55f
            place(ml, pv.m.tx, pv.m.ty, ms, dm)
            pv.mark = k; pv.mlp = ml
            k.setOnTouchListener(touch(pv, false))
            paint(pv)
            wm.addView(k, ml)
        } catch (e: Exception) { }
        if (pv.m.trig == 0) addHold(pv)
    }

    private fun paint(pv: PV) {
        val chosen = edit && pv === sel
        val g = GradientDrawable()
        g.shape = GradientDrawable.OVAL
        g.setColor(if (edit) 0xCCFFB300.toInt() else if (pv.on) 0xCC00E5FF.toInt() else 0xB3FF1744.toInt())
        g.setStroke(c.dp(if (chosen) 4 else 2), Color.WHITE)
        pv.hold?.background = g
        val g2 = GradientDrawable()
        g2.shape = GradientDrawable.OVAL
        g2.setColor(if (pv.on) 0x6600E5FF else 0x33000000)
        g2.setStroke(c.dp(3), if (chosen) Color.WHITE else if (edit) 0xFFFFB300.toInt() else 0xFF00E5FF.toInt())
        pv.mark?.background = g2
    }

    private fun paintAll() { for (pv in list) paint(pv) }

    private fun persist() { Km.save(c, list.map { it.m }) }

    // ---------- mesin ketuk ----------
    private fun setOn(pv: PV, b: Boolean) {
        if (b == pv.on && b) return
        pv.on = b
        paint(pv)
        if (b) {
            if (!Shz.ready()) { toast("Ketukan otomatis butuh Shizuku. Buka aplikasi ELAINA > tab AKTIVASI."); pv.on = false; paint(pv); return }
            val dm = scr()
            val x = (pv.m.tx / 1000f * dm.widthPixels).toInt()
            val y = (pv.m.ty / 1000f * dm.heightPixels).toInt()
            Tap.start(pv.id, x, y, Km.CPS[pv.m.spd.coerceIn(0, 3)])
        } else {
            Tap.stop(pv.id)
        }
    }

    private fun touch(pv: PV, isHold: Boolean): View.OnTouchListener {
        var sx = 0f
        var sy = 0f
        var ox = 0
        var oy = 0
        return View.OnTouchListener { v, e ->
            val lp = if (isHold) pv.hlp else pv.mlp
            if (lp == null) false
            else if (edit) {
                when (e.action) {
                    MotionEvent.ACTION_DOWN -> {
                        sx = e.rawX; sy = e.rawY; ox = lp.x; oy = lp.y
                        if (sel !== pv) { sel = pv; paintAll(); refreshBar() }
                    }
                    MotionEvent.ACTION_MOVE -> {
                        lp.x = ox + (e.rawX - sx).toInt()
                        lp.y = oy + (e.rawY - sy).toInt()
                        try { wm.updateViewLayout(v, lp) } catch (x: Exception) { }
                    }
                    MotionEvent.ACTION_UP -> {
                        val dm = scr()
                        val size = if (isHold) hs else ms
                        val fx = (((lp.x + size / 2f) / dm.widthPixels) * 1000).toInt().coerceIn(0, 1000)
                        val fy = (((lp.y + size / 2f) / dm.heightPixels) * 1000).toInt().coerceIn(0, 1000)
                        if (isHold) { pv.m.hx = fx; pv.m.hy = fy } else { pv.m.tx = fx; pv.m.ty = fy }
                        persist()
                    }
                }
                true
            } else if (isHold) {
                when (e.action) {
                    MotionEvent.ACTION_DOWN -> { if (pv.m.mode == 0) setOn(pv, true) else setOn(pv, !pv.on) }
                    MotionEvent.ACTION_UP, MotionEvent.ACTION_CANCEL -> { if (pv.m.mode == 0) setOn(pv, false) }
                }
                true
            } else false
        }
    }

    // ---------- editor ----------
    private fun chipsRow(items: List<String>, get: () -> Int, set: (Int) -> Unit): View {
        val row = LinearLayout(c)
        val tv = ArrayList<TextView>()
        val paint = {
            for (k in tv.indices) {
                val on = get() == k
                tv[k].setTextColor(if (on) Color.WHITE else C.MUTE)
                tv[k].background = if (on) Chamfer(C.RED, 0, c.dp(6).toFloat(), 0f) else Chamfer(C.PANEL2, C.LINE, c.dp(6).toFloat())
            }
        }
        for (k in items.indices) {
            val t = c.label(items[k], 12f, C.MUTE, true)
            t.gravity = Gravity.CENTER
            t.setPadding(c.dp(6), c.dp(9), c.dp(6), c.dp(9))
            t.setOnClickListener { set(k); paint() }
            tv.add(t)
            row.addView(t, c.lp(0, -2, 0, 1f).also { it.setMargins(c.dp(2), 0, c.dp(2), 0) })
        }
        painters.add(paint)
        paint()
        return row
    }

    private fun refreshBar() {
        val p = sel
        selT?.text = if (p != null) "Tombol terpilih: " + p.m.name else "Belum ada tombol. Ketuk + TAMBAH."
        for (f in painters) f()
    }

    private fun openBar() {
        if (bar != null) return
        val b = LinearLayout(c)
        b.orientation = LinearLayout.VERTICAL
        b.setPadding(c.dp(10), c.dp(10), c.dp(10), c.dp(10))
        b.background = Chamfer(0xF2101018.toInt(), C.RED, c.dp(12).toFloat(), 3f)
        b.addView(c.label("EDIT KEYMAP", 16f, Color.WHITE, true, true))
        b.addView(c.label("Seret tombol untuk memindah. Ketuk tombol untuk memilih lalu atur di bawah.", 10f, C.MUTE))
        val st = c.label("", 13f, C.CYAN, true)
        selT = st
        b.addView(st, c.lp(-1, -2, 6))
        b.addView(c.label("Pemicu (apa yang kamu tekan)", 11f, C.MUTE), c.lp(-1, -2, 4))
        b.addView(chipsRow(Km.TRIG, { sel?.m?.trig ?: 0 }) { v -> setTrig(v) }, c.lp(-1, -2, 2))
        b.addView(c.label("Cara kerja", 11f, C.MUTE), c.lp(-1, -2, 6))
        b.addView(chipsRow(listOf("Tahan", "Kunci"), { sel?.m?.mode ?: 0 }) { v -> sel?.m?.mode = v; persist() }, c.lp(-1, -2, 2))
        b.addView(c.label("Kecepatan ketuk", 11f, C.MUTE), c.lp(-1, -2, 6))
        b.addView(chipsRow(Km.SPD, { sel?.m?.spd ?: 2 }) { v -> sel?.m?.spd = v; persist() }, c.lp(-1, -2, 2))
        val act = LinearLayout(c)
        val add = c.rogBtn("+ TAMBAH", false) { addItem() }
        val del = c.rogBtn("HAPUS", false) { removeSel() }
        val done = c.rogBtn("SELESAI", true) { setEdit(false) }
        add.textSize = 12f; del.textSize = 12f; done.textSize = 12f
        act.addView(add, c.lp(0, -2, 0, 1f).also { it.rightMargin = c.dp(3) })
        act.addView(del, c.lp(0, -2, 0, 1f).also { it.setMargins(c.dp(3), 0, c.dp(3), 0) })
        act.addView(done, c.lp(0, -2, 0, 1f).also { it.leftMargin = c.dp(3) })
        b.addView(act, c.lp(-1, -2, 10))
        val mv = c.rogBtn("PINDAH MENU INI KE ATAS / BAWAH", false) {
            barTop = !barTop
            val lp = barLp
            val v = bar
            if (lp != null && v != null) {
                lp.gravity = (if (barTop) Gravity.TOP else Gravity.BOTTOM) or Gravity.CENTER_HORIZONTAL
                try { wm.updateViewLayout(v, lp) } catch (e: Exception) { }
            }
        }
        mv.textSize = 10f
        b.addView(mv, c.lp(-1, -2, 6))
        val dm = scr()
        val w = minOf(dm.widthPixels - c.dp(16), c.dp(340))
        val lp = WindowManager.LayoutParams(w, WindowManager.LayoutParams.WRAP_CONTENT,
            WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY,
            WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE or WindowManager.LayoutParams.FLAG_LAYOUT_NO_LIMITS,
            PixelFormat.TRANSLUCENT)
        lp.gravity = (if (barTop) Gravity.TOP else Gravity.BOTTOM) or Gravity.CENTER_HORIZONTAL
        lp.y = c.dp(8)
        try { wm.addView(b, lp) } catch (e: Exception) { return }
        bar = b
        barLp = lp
        refreshBar()
    }

    private fun setTrig(v: Int) {
        val pv = sel ?: return
        pv.m.trig = v
        if (v == 0) addHold(pv) else removeHold(pv)
        paintAll()
        persist()
        updateWatch()
        if (v != 0) toast("Pemicu tombol volume butuh Shizuku. Tekan tombol volume untuk memicu titik biru.")
    }

    private fun closeBar() {
        try { bar?.let { wm.removeViewImmediate(it) } } catch (e: Exception) { }
        bar = null
        barLp = null
        selT = null
        painters.clear()
    }

    private fun addItem() {
        if (list.size >= 6) { toast("Maksimal 6 tombol."); return }
        val pv = PV(Km.newItem(list.size), nextId++)
        build(pv)
        list.add(pv)
        sel = pv
        persist()
        paintAll()
        refreshBar()
    }

    private fun removeSel() {
        val pv = sel ?: return
        Tap.stop(pv.id)
        removeHold(pv)
        try { pv.mark?.let { wm.removeViewImmediate(it) } } catch (e: Exception) { }
        list.remove(pv)
        for (i in list.indices) {
            val n = "ABCDEF"[i.coerceIn(0, 5)].toString()
            list[i].m.name = n
            list[i].hold?.text = n
            list[i].mark?.text = n
        }
        sel = list.lastOrNull()
        persist()
        paintAll()
        refreshBar()
        updateWatch()
    }
}
__XH_EOF__
mkdir -p "app/src/main/java/com/crosshair/pro"
cat > "app/src/main/java/com/crosshair/pro/Mail.kt" <<'__XH_EOF__'
package com.crosshair.pro

import android.content.Context
import android.content.Intent
import android.net.Uri
import android.os.Build
import android.os.Handler
import android.os.Looper
import org.json.JSONObject
import java.net.HttpURLConnection
import java.net.URL

/** Kirim pesan ke developer lewat layanan formulir (FormSubmit) ke email developer. */
object Mail {
    const val TO = "fadhilarlingga64@gmail.com"
    private var last = 0L

    fun deviceInfo(): String = Build.MANUFACTURER + " " + Build.MODEL + " | Android " + Build.VERSION.RELEASE + " | ELAINA v4"

    fun send(name: String, contact: String, msg: String, info: Boolean, cb: (Boolean, String) -> Unit) {
        if (msg.trim().length < 10) { cb(false, "Pesan terlalu pendek (minimal 10 huruf)."); return }
        val now = System.currentTimeMillis()
        if (now - last < 30000) { cb(false, "Tunggu 30 detik sebelum mengirim lagi."); return }
        last = now
        val h = Handler(Looper.getMainLooper())
        Thread {
            var ok = false
            var out: String
            try {
                val o = JSONObject()
                o.put("name", if (name.isBlank()) "Pengguna ELAINA" else name)
                o.put("contact", contact)
                o.put("message", msg)
                if (info) o.put("device", deviceInfo())
                o.put("_subject", "ELAINA Optimasi - pesan pengguna")
                o.put("_captcha", "false")
                o.put("_template", "table")
                val cn = URL("https://formsubmit.co/ajax/" + TO).openConnection() as HttpURLConnection
                cn.requestMethod = "POST"
                cn.connectTimeout = 10000
                cn.readTimeout = 15000
                cn.doOutput = true
                cn.setRequestProperty("Content-Type", "application/json")
                cn.setRequestProperty("Accept", "application/json")
                cn.outputStream.use { it.write(o.toString().toByteArray()) }
                val code = cn.responseCode
                val body = (if (code in 200..299) cn.inputStream else cn.errorStream)?.bufferedReader()?.readText() ?: ""
                ok = code in 200..299 && body.contains("\"success\":\"true\"")
                out = if (ok) "Pesan terkirim. Terima kasih!"
                else if (body.contains("ctivation")) "Pesan diterima layanan, tapi formulir belum diaktifkan developer. Kirim lewat aplikasi email dulu."
                else "Gagal mengirim (kode " + code + "). Coba lewat aplikasi email."
            } catch (e: Exception) {
                out = "Tidak ada koneksi internet atau layanan sedang gangguan."
            }
            val r = out
            val k = ok
            h.post { cb(k, r) }
        }.start()
    }

    fun viaEmailApp(msg: String, info: Boolean): Intent {
        val i = Intent(Intent.ACTION_SENDTO, Uri.parse("mailto:" + TO))
        i.putExtra(Intent.EXTRA_SUBJECT, "ELAINA Optimasi - pesan pengguna")
        i.putExtra(Intent.EXTRA_TEXT, msg + (if (info) "\n\n" + deviceInfo() else ""))
        return i
    }
}
__XH_EOF__
mkdir -p "app/src/main/java/com/crosshair/pro"
cat > "app/src/main/java/com/crosshair/pro/MainActivity.kt" <<'__XH_EOF__'
package com.crosshair.pro

import android.Manifest
import android.app.Activity
import android.app.AlertDialog
import android.app.NotificationManager
import android.content.ClipData
import android.content.ClipboardManager
import android.content.Context
import android.content.Intent
import android.content.pm.ApplicationInfo
import android.content.pm.PackageManager
import android.content.res.ColorStateList
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.graphics.Color
import android.graphics.Matrix
import android.graphics.drawable.Drawable
import android.graphics.drawable.GradientDrawable
import android.media.ExifInterface
import android.media.projection.MediaProjectionManager
import android.net.Uri
import android.os.Build
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import android.os.PowerManager
import android.provider.Settings
import android.view.Gravity
import android.view.View
import android.widget.*
import java.io.File
import java.io.FileOutputStream
import java.util.concurrent.Executors
import rikka.shizuku.Shizuku

class Game(val pkg: String, val name: String, val icon: Drawable, val isGame: Boolean)

class MainActivity : Activity() {
    private lateinit var s: Spec
    private lateinit var content: FrameLayout
    private lateinit var navRow: LinearLayout
    private var tab = 0
    private var allApps: List<Game> = emptyList()
    private var preview: CrosshairView? = null
    private var preview2: CrosshairView? = null
    private var pick: PickView? = null
    private var pending: String? = null
    private val ex = Executors.newSingleThreadExecutor()
    private val hd = Handler(Looper.getMainLooper())
    private var monitor: Runnable? = null
    private var paintMask: (() -> Unit)? = null
    private val permL = Shizuku.OnRequestPermissionResultListener { _, _ -> runOnUiThread { showTab(tab) } }

    override fun onCreate(b: Bundle?) {
        super.onCreate(b)
        s = Spec(this)
        window.statusBarColor = C.BG
        window.navigationBarColor = C.BG
        val root = LinearLayout(this)
        root.orientation = LinearLayout.VERTICAL
        root.setBackgroundColor(C.BG)
        content = FrameLayout(this)
        root.addView(content, LinearLayout.LayoutParams(-1, 0, 1f))
        navRow = LinearLayout(this)
        navRow.setBackgroundColor(C.PANEL)
        val names = listOf("TURBO", "CROSS", "KEYMAP", "OPTIMASI", "LAINNYA")
        for (i in names.indices) {
            val t = label(names[i], 11f, C.MUTE, true)
            t.gravity = Gravity.CENTER
            t.setPadding(0, dp(16), 0, dp(16))
            t.setOnClickListener { if (i == 4) sub = 0; showTab(i) }
            navRow.addView(t, LinearLayout.LayoutParams(0, -2, 1f))
        }
        root.addView(navRow, LinearLayout.LayoutParams(-1, -2))
        setContentView(root)
        loadGames()
        val ex0 = intent.getIntExtra("sub", 0)
        if (ex0 > 0) goSub(ex0) else showTab(0)
        try { Shizuku.addRequestPermissionResultListener(permL) } catch (e: Throwable) { }
        val app = applicationContext
        Thread { if (OverlayService.instance == null) Opt.restore(app) }.start()
    }

    override fun onResume() {
        super.onResume()
        if (tab == 0 || tab == 3 || tab == 4) showTab(tab)
    }

    override fun onPause() {
        super.onPause()
        monitor?.let { hd.removeCallbacks(it) }
    }

    override fun onDestroy() {
        try { Shizuku.removeRequestPermissionResultListener(permL) } catch (e: Throwable) { }
        super.onDestroy()
    }

    private fun toast(t: String) { Toast.makeText(this, t, Toast.LENGTH_LONG).show() }

    private fun copyText(t: String) {
        val cm = getSystemService(Context.CLIPBOARD_SERVICE) as ClipboardManager
        cm.setPrimaryClip(ClipData.newPlainText("ELAINA", t))
        toast("Disalin ke papan klip.")
    }

    private fun showTab(i: Int) {
        tab = i
        monitor?.let { hd.removeCallbacks(it) }
        monitor = null
        for (k in 0 until navRow.childCount) {
            val t = navRow.getChildAt(k) as TextView
            val on = k == i
            t.setTextColor(if (on) C.RED else C.MUTE)
            t.background = if (on) Chamfer(0x228B3DFF, C.RED, dp(8).toFloat(), 2f) else null
        }
        val sv = ScrollView(this)
        val col = LinearLayout(this)
        col.orientation = LinearLayout.VERTICAL
        col.setPadding(dp(16), dp(16), dp(16), dp(24))
        when (i) {
            0 -> buildTurbo(col)
            1 -> buildCross(col)
            2 -> buildKeymap(col)
            3 -> buildOptim(col)
            else -> buildMore(col)
        }
        sv.addView(col)
        content.removeAllViews()
        content.addView(sv)
    }

    private fun apply() {
        preview?.invalidate()
        preview2?.invalidate()
        OverlayService.instance?.refresh()
    }

    private fun pickRow(items: List<String>, sel: Int, onSel: (Int) -> Unit): View {
        val hs = HorizontalScrollView(this)
        hs.isHorizontalScrollBarEnabled = false
        val row = LinearLayout(this)
        val chips = ArrayList<TextView>()
        var cur = sel
        val paint = {
            for (k in chips.indices) {
                val on = k == cur
                chips[k].setTextColor(if (on) Color.WHITE else C.MUTE)
                chips[k].background = if (on) Chamfer(C.RED, 0, dp(8).toFloat(), 0f) else Chamfer(C.PANEL2, C.LINE, dp(8).toFloat())
            }
        }
        for (k in items.indices) {
            val t = label(items[k], 14f, C.MUTE, true)
            t.setPadding(dp(16), dp(10), dp(16), dp(10))
            t.setOnClickListener { cur = k; paint(); onSel(k) }
            chips.add(t)
            row.addView(t, LinearLayout.LayoutParams(-2, -2).also { it.rightMargin = dp(8) })
        }
        paint()
        hs.addView(row)
        return hs
    }

    private fun seekPlus(name: String, key: String, lo: Int, hi: Int, step: Int, quick: List<Int>): View {
        val col = LinearLayout(this)
        col.orientation = LinearLayout.VERTICAL
        val tv = label("", 13f, C.TEXT, true)
        fun upd() { tv.text = name + ":  " + s.i(key) }
        upd()
        val sb = SeekBar(this)
        sb.max = hi - lo
        sb.progress = (s.i(key) - lo).coerceIn(0, hi - lo)
        sb.progressTintList = ColorStateList.valueOf(C.RED)
        sb.thumbTintList = ColorStateList.valueOf(C.RED)
        sb.setOnSeekBarChangeListener(object : SeekBar.OnSeekBarChangeListener {
            override fun onProgressChanged(bar: SeekBar?, p: Int, user: Boolean) { s.set(key, p + lo); upd(); apply() }
            override fun onStartTrackingTouch(bar: SeekBar?) {}
            override fun onStopTrackingTouch(bar: SeekBar?) {}
        })
        col.addView(tv)
        col.addView(sb)
        val row = LinearLayout(this)
        row.addView(rogBtn("-", false) { sb.progress = (sb.progress - step).coerceIn(0, hi - lo) }, lp(0, -2, 0, 1f).also { it.rightMargin = dp(4) })
        row.addView(rogBtn("+", false) { sb.progress = (sb.progress + step).coerceIn(0, hi - lo) }, lp(0, -2, 0, 1f).also { it.setMargins(dp(4), 0, dp(4), 0) })
        for (q in quick) row.addView(rogBtn("" + q, false) { sb.progress = (q - lo).coerceIn(0, hi - lo) }, lp(0, -2, 0, 1f).also { it.leftMargin = dp(4) })
        col.addView(row, lp(-1, -2, 4))
        return col
    }

    private fun statusRow(col: LinearLayout, text: String, ok: Boolean, btn: String?, action: (() -> Unit)?) {
        val c = card(12)
        c.addView(label((if (ok) "[OK]  " else "[BELUM]  ") + text, 14f, if (ok) C.GREEN else C.HOT, true))
        if (!ok && btn != null && action != null) c.addView(rogBtn(btn, true) { action() }, lp(-1, -2, 8))
        col.addView(c, lp(-1, -2, 8))
    }

    // ================= TURBO =================
    private fun buildTurbo(col: LinearLayout) {
        header(col, "OPTIMASI  •  GAME TURBO")
        val on = OverlayService.instance != null
        val ac = card()
        ac.addView(label(if (on) "GAME TURBO AKTIF" else "GAME TURBO SIAP", 16f, if (on) C.GREEN else C.CYAN, true, true))
        ac.addView(label(if (on) "Crosshair dan menu sedang berjalan di atas game." else "Pilih game lalu tekan START. Crosshair dan menu muncul otomatis.", 12f, C.MUTE))
        if (on) ac.addView(rogBtn("MATIKAN", false) { stopService(Intent(this, OverlayService::class.java)); hd.postDelayed({ showTab(0) }, 300) }, lp(-1, -2, 10))
        col.addView(ac, lp(-1, -2, 14))
        col.addView(label(if (Shz.ready()) "Shizuku: TERHUBUNG" else "Shizuku belum aktif. Fitur dasar tetap jalan. Lihat tab AKTIVASI.", 12f, if (Shz.ready()) C.GREEN else C.MUTE, true), lp(-1, -2, 8))
        buildLive(col)

        col.addView(section("MAIN SEKARANG"), lp(-2, -2, 22))
        col.addView(label("Masuk mode game: intro ELAINA PROJEK, lalu pilih game di layar miring beserta info CPU, RAM, dan baterai. Crosshair dan menu langsung aktif di dalam game.", 12f, C.MUTE), lp(-1, -2, 8))
        col.addView(rogBtn("MASUK MODE GAME", true) { try { startActivity(Intent(this, HubActivity::class.java)) } catch (e: Exception) { toast("Gagal membuka mode game: " + e.message) } }, lp(-1, -2, 12))
    }

    private fun buildLive(col: LinearLayout) {
        col.addView(section("PANTAU PERANGKAT"), lp(-2, -2, 18))
        val ramT = label("", 13f, C.TEXT, true)
        val ramB = Bar(this)
        val batT = label("", 13f, C.TEXT, true)
        val batB = Bar(this)
        val cpuT = label("", 13f, C.TEXT, true)
        val pingT = label("PING: mengukur...", 13f, C.TEXT, true)
        val c1 = card()
        c1.addView(ramT)
        c1.addView(ramB, LinearLayout.LayoutParams(-1, dp(8)).also { it.topMargin = dp(6) })
        c1.addView(batT, lp(-1, -2, 10))
        c1.addView(batB, LinearLayout.LayoutParams(-1, dp(8)).also { it.topMargin = dp(6) })
        c1.addView(cpuT, lp(-1, -2, 10))
        c1.addView(pingT, lp(-1, -2, 4))
        col.addView(c1, lp(-1, -2, 10))
        var n = 0
        val r = object : Runnable {
            override fun run() {
                val (u, t, p) = Stats.ram(this@MainActivity)
                ramT.text = "RAM:  $u / $t MB  ($p%)"; ramB.pct = p; ramB.invalidate()
                val (bp, bt) = Stats.battery(this@MainActivity)
                batT.text = "BATERAI:  $bp%  •  " + "%.1f".format(bt) + "°C  •  " + Stats.thermal(this@MainActivity)
                batB.pct = bp; batB.col = C.GREEN; batB.invalidate()
                Stats.pollCpu()
                cpuT.text = "CPU:  " + Stats.cpu()
                n++
                if (n % 2 == 1) Stats.ping { ms -> pingT.text = if (ms < 0) "PING:  tidak terhubung" else "PING:  $ms ms" }
                hd.postDelayed(this, 2000)
            }
        }
        monitor = r
        r.run()
    }

    // ================= UMUM =================
    private fun header(col: LinearLayout, sub: String) {
        val row = LinearLayout(this)
        row.gravity = Gravity.CENTER_VERTICAL
        val av = ShapeImageView(this, s)
        av.setImageResource(R.drawable.elaina)
        row.addView(av, LinearLayout.LayoutParams(dp(60), dp(60)))
        val tc = LinearLayout(this)
        tc.orientation = LinearLayout.VERTICAL
        tc.setPadding(dp(12), 0, 0, 0)
        val t1 = label("ELAINA", 30f, Color.WHITE, true, true)
        t1.setShadowLayer(14f, 0f, 0f, C.RED)
        tc.addView(t1)
        tc.addView(label(sub, 12f, C.RED, true))
        row.addView(tc)
        col.addView(row)
    }

    private fun tile(title: String, value: String): LinearLayout {
        val c = card(10)
        c.addView(label(title, 11f, C.MUTE, true))
        c.addView(label(value, 20f, Color.WHITE, true, true))
        return c
    }

    private fun isGame(ai: ApplicationInfo): Boolean {
        return ai.category == ApplicationInfo.CATEGORY_GAME || (ai.flags and ApplicationInfo.FLAG_IS_GAME) != 0
    }

    private fun loadGames() {
        ex.execute {
            try {
                val pm = packageManager
                val i = Intent(Intent.ACTION_MAIN).addCategory(Intent.CATEGORY_LAUNCHER)
                val list = pm.queryIntentActivities(i, 0).mapNotNull { ri ->
                    val ai = ri.activityInfo.applicationInfo
                    if (ai.packageName == packageName) null else Game(ai.packageName, ri.loadLabel(pm).toString(), ri.loadIcon(pm), isGame(ai))
                }.distinctBy { it.pkg }.sortedBy { it.name.lowercase() }
                runOnUiThread { allApps = list; if (tab == 0) showTab(0) }
            } catch (e: Exception) {
                runOnUiThread { toast("Gagal membaca daftar aplikasi.") }
            }
        }
    }

    private fun pickGames() {
        if (allApps.isEmpty()) { toast("Daftar aplikasi belum siap."); return }
        val names = allApps.map { it.name }.toTypedArray()
        val pins = s.pins()
        val chk = BooleanArray(allApps.size) { pins.contains(allApps[it].pkg) }
        AlertDialog.Builder(this).setTitle("Pilih game")
            .setMultiChoiceItems(names, chk) { _, w, c -> chk[w] = c }
            .setPositiveButton("Simpan") { _, _ ->
                val np = HashSet<String>()
                for (k in chk.indices) if (chk[k]) np.add(allApps[k].pkg)
                s.setPins(np)
                showTab(0)
            }
            .setNegativeButton("Batal", null).show()
    }

    private fun startGame(g: Game) {
        if (!Settings.canDrawOverlays(this)) {
            toast("Aktifkan izin Tampil di atas aplikasi lain untuk ELAINA, lalu kembali dan tekan START lagi.")
            startActivity(Intent(Settings.ACTION_MANAGE_OVERLAY_PERMISSION, Uri.parse("package:$packageName")))
            return
        }
        if (Build.VERSION.SDK_INT >= 33 && checkSelfPermission(Manifest.permission.POST_NOTIFICATIONS) != PackageManager.PERMISSION_GRANTED) {
            requestPermissions(arrayOf(Manifest.permission.POST_NOTIFICATIONS), 1)
        }
        pending = g.pkg
        if (s.b("shot") && !Shz.ready()) {
            try {
                val mpm = getSystemService(MediaProjectionManager::class.java)
                startActivityForResult(mpm.createScreenCaptureIntent(), 77)
                return
            } catch (e: Exception) { }
        }
        launchGame(g.pkg, null, 0)
    }

    private fun launchGame(pkg: String?, data: Intent?, code: Int) {
        if (Shz.ready()) {
            val app = applicationContext
            val sp = s
            Thread { Opt.apply(app, sp, pkg) }.start()
        }
        val i = Intent(this, OverlayService::class.java)
        if (data != null) { i.putExtra("code", code); i.putExtra("data", data) }
        try { startForegroundService(i) } catch (e: Exception) { toast("Gagal menyalakan Game Turbo."); return }
        hd.postDelayed({
            val li = if (pkg != null) packageManager.getLaunchIntentForPackage(pkg) else null
            if (li != null) startActivity(li) else toast("Game tidak bisa dibuka.")
        }, 600)
    }

    @Deprecated("Deprecated in Java")
    override fun onActivityResult(rc: Int, res: Int, d: Intent?) {
        super.onActivityResult(rc, res, d)
        val u = d?.data
        if (rc == 9 && res == RESULT_OK && u != null) loadPhoto(u)
        if (rc == 77) launchGame(pending, if (res == RESULT_OK) d else null, res)
    }


    // ================= CROSSHAIR =================
    private fun photoBox(col: LinearLayout, h: Int, second: Boolean) {
        val box = FrameLayout(this)
        box.background = Chamfer(0xFF1A0B33.toInt(), C.RED, dp(14).toFloat(), 3f)
        val pv = CrosshairView(this, s)
        pv.photo = Store.cut(this)
        if (second) preview2 = pv else preview = pv
        box.addView(pv, FrameLayout.LayoutParams(-1, -1))
        col.addView(box, lp(-1, dp(h), if (second) 10 else 14))
    }

    private fun dpad(): View {
        val col = LinearLayout(this)
        col.orientation = LinearLayout.VERTICAL
        val tv = label("", 13f, C.TEXT, true)
        fun upd() { tv.text = "Posisi foto:  X " + s.i("pDx") + "   Y " + s.i("pDy") }
        upd()
        fun nudge(dx: Int, dy: Int) {
            s.set("pDx", (s.i("pDx") + dx).coerceIn(-140, 140))
            s.set("pDy", (s.i("pDy") + dy).coerceIn(-140, 140))
            upd(); apply()
        }
        fun cell(t: String?, a: (() -> Unit)?): View {
            if (t == null || a == null) return View(this)
            return rogBtn(t, false) { a() }
        }
        val rows = listOf(
            listOf(cell(null, null), cell("^", { nudge(0, -4) }), cell(null, null)),
            listOf(cell("<", { nudge(-4, 0) }), cell("RESET", { s.set("pDx", 0); s.set("pDy", 0); upd(); apply() }), cell(">", { nudge(4, 0) })),
            listOf(cell(null, null), cell("v", { nudge(0, 4) }), cell(null, null))
        )
        col.addView(tv)
        for (r in rows) {
            val row = LinearLayout(this)
            for (v in r) row.addView(v, lp(0, -2, 0, 1f).also { it.setMargins(dp(3), dp(3), dp(3), dp(3)) })
            col.addView(row, lp(-1, -2, 2))
        }
        return col
    }

    private fun buildCross(col: LinearLayout) {
        header(col, "EDITOR CROSSHAIR")
        photoBox(col, 220, false)

        col.addView(section("BENTUK"), lp(-2, -2, 20))
        col.addView(label("Pilih satu atau lebih bentuk lalu gabungkan sesukamu.", 12f, C.MUTE), lp(-1, -2, 6))
        col.addView(maskRow(), lp(-1, -2, 8))
        col.addView(label("Preset gabungan", 12f, C.MUTE), lp(-1, -2, 12))
        col.addView(presetRow(), lp(-1, -2, 6))
        col.addView(section("WARNA"), lp(-2, -2, 20))
        col.addView(colors(), lp(-1, -2, 8))
        col.addView(section("UKURAN"), lp(-2, -2, 20))
        col.addView(seek("Panjang garis", "len", 2, 60, false), lp(-1, -2, 6))
        col.addView(seek("Tebal garis", "th", 1, 14, false), lp(-1, -2, 6))
        col.addView(seek("Celah tengah", "gap", 0, 40, false), lp(-1, -2, 6))
        col.addView(seek("Radius cincin", "ring", 6, 60, false), lp(-1, -2, 6))
        col.addView(seek("Rotasi", "rot", 0, 360, false), lp(-1, -2, 6))
        col.addView(seek("Transparansi", "op", 10, 100, false), lp(-1, -2, 6))
        col.addView(seek("Ukuran titik", "dotSize", 1, 16, false), lp(-1, -2, 6))
        col.addView(check("Garis tepi hitam", "outline"))

        col.addView(section("POSISI DI LAYAR GAME"), lp(-2, -2, 20))
        col.addView(label("Geser jika crosshair game kamu tidak tepat di tengah.", 12f, C.MUTE), lp(-1, -2, 6))
        col.addView(seek("Geser kiri / kanan", "offX", -200, 200, false), lp(-1, -2, 6))
        col.addView(seek("Geser atas / bawah", "offY", -300, 300, false), lp(-1, -2, 6))

        col.addView(section("FOTO JADI CROSSHAIR"), lp(-2, -2, 22))
        col.addView(label("Crosshair foto hanya bisa diatur di sini. Latar dihapus otomatis.", 12f, C.MUTE), lp(-1, -2, 8))
        col.addView(rogBtn("PILIH FOTO", true) {
            val i = Intent(Intent.ACTION_GET_CONTENT)
            i.type = "image/*"
            startActivityForResult(i, 9)
        }, lp(-1, -2, 10))
        val pk = PickView(this)
        pk.onPick = { x, y -> pickBg(x, y) }
        pick = pk
        col.addView(pk, lp(-1, dp(220), 10))
        col.addView(label("Ketuk bagian latar pada pratinjau untuk memilih warna yang dihapus.", 12f, C.MUTE), lp(-1, -2, 6))
        col.addView(chipRow("mode", listOf("Dari tepi", "Seluruh gambar"), true, null), lp(-1, -2, 10))
        col.addView(seek("Toleransi warna", "tol", 5, 150, true), lp(-1, -2, 8))
        col.addView(seek("Haluskan tepi", "feather", 0, 6, true), lp(-1, -2, 6))

        col.addView(section("EDIT FOTO"), lp(-2, -2, 24))
        col.addView(label("Pratinjau langsung. Atur ukuran, putaran, dan posisi foto di bawah ini.", 12f, C.MUTE), lp(-1, -2, 6))
        photoBox(col, 200, true)
        col.addView(seekPlus("Ukuran foto", "pSize", 10, 280, 5, listOf()), lp(-1, -2, 12))
        col.addView(seekPlus("Putar foto (derajat)", "pRot", 0, 360, 15, listOf(0, 90, 180, 270)), lp(-1, -2, 12))
        col.addView(label("Geser posisi foto", 12f, C.MUTE), lp(-1, -2, 12))
        col.addView(dpad(), lp(-1, -2, 4))
        col.addView(seek("Transparansi foto", "pOp", 10, 100, false), lp(-1, -2, 12))
        col.addView(label("Bentuk foto crosshair", 12f, C.MUTE), lp(-1, -2, 12))
        col.addView(chipRow("pShape", listOf("Kotak", "Bulat"), false, null), lp(-1, -2, 6))
        col.addView(check("Bingkai cincin (untuk foto bulat)", "pRing"))
        col.addView(check("Pakai foto sebagai crosshair", "usePhoto"))
        col.addView(check("Satu warna (siluet)", "tint"))
        col.addView(rogBtn("RESET UKURAN, PUTARAN, POSISI FOTO", false) {
            s.set("pSize", 70); s.set("pRot", 0); s.set("pDx", 0); s.set("pDy", 0); s.set("pOp", 100)
            apply()
            showTab(1)
        }, lp(-1, -2, 12))
        if (File(filesDir, "src.png").exists()) reprocess()
    }

    // ================= KEYMAP =================
    private fun kmSync() { OverlayService.instance?.kmReload() }

    private fun runTest(pad: PadView) {
        if (!Shz.ready()) { toast("Nyalakan Shizuku dulu (tab AKTIVASI)."); return }
        val loc = IntArray(2)
        pad.getLocationOnScreen(loc)
        val x = loc[0] + pad.width / 2
        val y = loc[1] + pad.height / 2
        pad.reset()
        pad.msg = "Mengetes 3 detik..."
        pad.invalidate()
        val app = applicationContext
        val eng = s.i("kmEng")
        Thread {
            val ok = Tap.ensure(app, eng)
            if (ok) {
                Tap.start(99, x, y, 0)
                try { Thread.sleep(3000) } catch (e: Exception) { }
                Tap.stop(99)
            }
            try { Thread.sleep(400) } catch (e: Exception) { }
            runOnUiThread {
                val n = pad.count
                pad.msg = if (!ok) "Gagal: " + Tap.label else "" + (n / 3) + " ketukan/detik  •  " + Tap.label
                pad.invalidate()
                if (ok && n == 0) toast("Ketukan terkirim tapi tidak masuk. Coba mesin lain di atas.")
            }
        }.start()
    }

    private fun buildKeymap(col: LinearLayout) {
        header(col, "KEYMAP  •  KETUK OTOMATIS")
        val ready = Shz.ready()
        val st = card()
        st.addView(label(if (ready) "SHIZUKU TERHUBUNG" else "KEYMAP BUTUH SHIZUKU", 15f, if (ready) C.GREEN else C.HOT, true, true))
        st.addView(label(if (ready) "Mesin ketuk: " + Tap.label else "Nyalakan Shizuku dulu di tab AKTIVASI.", 12f, C.MUTE))
        if (!ready) st.addView(rogBtn("KE TAB AKTIVASI", true) { goSub(1) }, lp(-1, -2, 10))
        if (Build.VERSION.SDK_INT < 34)
            st.addView(label("Android " + Build.VERSION.RELEASE + ": pemicu lewat layar bisa memutus sentuhan jari lain (misalnya arah bidik). Pakai pemicu tombol VOLUME atau mode Kunci supaya aman.", 11f, C.HOT), lp(-1, -2, 8))
        col.addView(st, lp(-1, -2, 14))
        col.addView(check("Tampilkan keymap saat Game Turbo menyala", "kmOn"), lp(-1, -2, 8))

        col.addView(section("CARA KERJA"), lp(-2, -2, 18))
        col.addView(label("Tiap tombol punya dua bagian:\n• PEMICU = yang kamu tekan: tombol bulat MERAH di layar, atau tombol VOLUME fisik.\n• LINGKARAN BIRU = titik di game yang diketuk otomatis (misalnya tombol tembak).\nTekan pemicu, titik biru diketuk cepat.", 12f, C.MUTE), lp(-1, -2, 8))
        col.addView(section("LANGKAH (DI DALAM GAME)"), lp(-2, -2, 18))
        col.addView(label("1. Tekan START di tab TURBO.\n2. Ketuk ikon Elaina > KEYMAP > EDIT TOMBOL.\n3. Ketuk + TAMBAH. Muncul tombol merah dan lingkaran biru.\n4. Seret lingkaran biru ke tombol game yang mau diketuk otomatis.\n5. Pilih pemicu: Layar (seret tombol merah ke tempat jarimu), Vol - atau Vol +.\n6. Pilih Tahan/Kunci dan kecepatan, lalu SELESAI.", 12f, C.MUTE), lp(-1, -2, 8))

        col.addView(section("MESIN KETUK"), lp(-2, -2, 20))
        col.addView(label("Otomatis memakai mesin CEPAT (injector) dan beralih ke STANDAR bila gagal. Kalau ketukan tidak masuk ke game, coba mesin lain lalu uji di papan bawah.", 12f, C.MUTE), lp(-1, -2, 8))
        col.addView(chipRow("kmEng", listOf("Otomatis", "Cepat saja", "Standar saja"), false) { Thread { Tap.shutdown() }.start() }, lp(-1, -2, 8))
        col.addView(section("UJI KECEPATAN"), lp(-2, -2, 20))
        val pad = PadView(this)
        col.addView(pad, lp(-1, dp(120), 8))
        col.addView(rogBtn("TES 3 DETIK", true) { runTest(pad) }, lp(-1, -2, 8))
        col.addView(label("Papan ini menghitung ketukan yang benar-benar masuk. Kalau angkanya 0, kirim screenshot papan ini.", 11f, C.MUTE), lp(-1, -2, 6))

        col.addView(section("TOMBOL KAMU"), lp(-2, -2, 22))
        col.addView(label("Posisi diatur di dalam game. Di sini kamu mengatur pemicu, cara kerja, dan kecepatan.", 11f, C.MUTE), lp(-1, -2, 6))
        val list = Km.load(this)
        if (list.isEmpty()) col.addView(label("Belum ada tombol. Ketuk TAMBAH TOMBOL atau tambah lewat menu di game.", 13f, C.MUTE), lp(-1, -2, 10))
        for (idx in list.indices) {
            val km = list[idx]
            val c = card()
            c.addView(label("TOMBOL " + km.name, 16f, Color.WHITE, true, true))
            c.addView(label("Pemicu", 12f, C.MUTE), lp(-1, -2, 8))
            c.addView(pickRow(Km.TRIG, km.trig) { km.trig = it; Km.save(this, list); kmSync() }, lp(-1, -2, 4))
            c.addView(label("Cara kerja", 12f, C.MUTE), lp(-1, -2, 8))
            c.addView(pickRow(listOf("Tahan", "Kunci"), km.mode) { km.mode = it; Km.save(this, list); kmSync() }, lp(-1, -2, 4))
            c.addView(label("Kecepatan ketuk", 12f, C.MUTE), lp(-1, -2, 8))
            c.addView(pickRow(Km.SPD, km.spd) { km.spd = it; Km.save(this, list); kmSync() }, lp(-1, -2, 4))
            c.addView(rogBtn("HAPUS TOMBOL", false) {
                list.removeAt(idx)
                Km.rename(list)
                Km.save(this, list)
                kmSync()
                showTab(2)
            }, lp(-1, -2, 12))
            col.addView(c, lp(-1, -2, 10))
        }
        col.addView(rogBtn("+ TAMBAH TOMBOL", true) {
            if (list.size >= 6) toast("Maksimal 6 tombol.") else {
                list.add(Km.newItem(list.size))
                Km.save(this, list)
                kmSync()
                showTab(2)
            }
        }, lp(-1, -2, 14))
        col.addView(label("Tahan = ketuk otomatis selama pemicu ditahan. Kunci = tekan sekali untuk mulai, tekan lagi untuk berhenti.\nBiasa sekitar 5 ketukan/detik, Sedang 10, Cepat 20, Gila secepat HP mampu (mesin CEPAT bisa 30 sampai 60).\nPemicu Vol - / Vol + membaca tombol volume fisik dan tetap mengubah volume suara.", 11f, C.MUTE), lp(-1, -2, 10))
        col.addView(label("Banyak game online melarang auto-click. Pakai dengan risiko sendiri, paling aman di game offline.", 11f, C.HOT), lp(-1, -2, 8))
    }

    // ================= OPTIMASI =================
    private fun buildOptim(col: LinearLayout) {
        header(col, "OPTIMASI & GRAFIK")
        val ready = Shz.ready()
        val st = card()
        st.addView(label(if (ready) "SHIZUKU TERHUBUNG" else "SEBAGIAN BUTUH SHIZUKU", 15f, if (ready) C.GREEN else C.HOT, true, true))
        st.addView(label(if (ready) "Semua pengaturan di bawah aktif otomatis saat START dan dikembalikan saat Game Turbo dimatikan." else "Tanpa Shizuku, hanya animasi sistem yang bisa diatur dan itu butuh izin ADB sekali. Lainnya butuh Shizuku. Lihat tab AKTIVASI.", 12f, C.MUTE))
        if (!ready) st.addView(rogBtn("KE TAB AKTIVASI", true) { goSub(1) }, lp(-1, -2, 10))
        col.addView(st, lp(-1, -2, 14))

        col.addView(section("PELICIN LAYAR (1 - 100%)"), lp(-2, -2, 20))
        val smT = label("", 18f, Color.WHITE, true, true)
        val smD = label("", 12f, C.MUTE)
        fun updSm() { val lv = s.i("smooth"); smT.text = if (lv <= 0) "Kelicinan: MATI" else "Kelicinan: " + lv + "%"; smD.text = Opt.smoothDesc(lv) }
        col.addView(smT, lp(-1, -2, 8))
        val sbs = SeekBar(this)
        sbs.max = 100
        sbs.progress = s.i("smooth")
        sbs.progressTintList = ColorStateList.valueOf(C.RED)
        sbs.thumbTintList = ColorStateList.valueOf(C.RED)
        sbs.setOnSeekBarChangeListener(object : SeekBar.OnSeekBarChangeListener {
            override fun onProgressChanged(bar: SeekBar?, p: Int, user: Boolean) { if (user) { Opt.smooth(s, p); updSm() } }
            override fun onStartTrackingTouch(bar: SeekBar?) {}
            override fun onStopTrackingTouch(bar: SeekBar?) {}
        })
        col.addView(sbs, lp(-1, -2, 4))
        col.addView(smD, lp(-1, -2, 4))
        updSm()
        col.addView(label("Makin tinggi, makin licin: animasi dipercepat, refresh rate naik, mode performa tetap. Terpasang otomatis saat START dan dikembalikan saat Game Turbo dimatikan. Hasil bergantung pada game dan HP.", 11f, C.MUTE), lp(-1, -2, 6))
        col.addView(rogBtn("TERAPKAN SEKARANG", true) {
            val app = applicationContext
            Thread { Opt.restore(app); Opt.apply(app, s, null); runOnUiThread { toast("Diterapkan.") } }.start()
        }, lp(-1, -2, 10))

        col.addView(section("AUTO BERSIH RAM"), lp(-2, -2, 22))
        col.addView(toggleRow("Auto bersih RAM saat bermain", s.b("autoClean")) { s.set("autoClean", if (it) 1 else 0) }, lp(-1, -2, 8))
        col.addView(label("Kapan dibersihkan", 12f, C.MUTE), lp(-1, -2, 10))
        col.addView(pickRow(listOf("Saat START", "3 menit", "5 menit", "10 menit", "Pintar"), s.i("cleanMode")) { s.set("cleanMode", it) }, lp(-1, -2, 4))
        col.addView(label("Pintar = otomatis saat RAM terpakai lebih dari 85%. Tanpa Shizuku, yang dibersihkan hanya aplikasi yang sedang di latar belakang; dengan Shizuku lebih menyeluruh.", 11f, C.MUTE), lp(-1, -2, 6))

        col.addView(section("PROFIL PERFORMA"), lp(-2, -2, 20))
        col.addView(label("Normal = tanpa perubahan.\nSeimbang = bersihkan RAM, Game Mode, animasi cepat.\nPerforma = tambah refresh rate 120 Hz.\nMaks = animasi mati dan mode performa tetap.", 12f, C.MUTE), lp(-1, -2, 8))
        col.addView(pickRow(listOf("Normal", "Seimbang", "Performa", "Maks"), s.i("perf")) { Opt.preset(s, it); showTab(3) }, lp(-1, -2, 8))

        col.addView(section("PENGATURAN LAIN"), lp(-2, -2, 22))
        col.addView(label("Animasi sistem", 12f, C.MUTE), lp(-1, -2, 12))
        col.addView(pickRow(listOf("Normal", "Cepat", "Mati"), s.i("anim")) { s.set("anim", it) }, lp(-1, -2, 6))
        col.addView(label("Refresh rate paksa (HP yang tidak mendukung akan mengabaikan)", 12f, C.MUTE), lp(-1, -2, 12))
        col.addView(pickRow(listOf("Bawaan", "90 Hz", "120 Hz", "144 Hz"), s.i("hz")) { s.set("hz", it) }, lp(-1, -2, 6))
        col.addView(check("Bersihkan RAM otomatis saat START", "autoClean"), lp(-1, -2, 12))
        col.addView(check("Mode performa game (Game Mode)", "gmode"))
        col.addView(check("Kunci mode performa tinggi (Android 12+)", "fperf"))

        col.addView(section("TERAPKAN"), lp(-2, -2, 22))
        col.addView(rogBtn("TERAPKAN SEKARANG", true) {
            if (!ready && !Opt.secureOk(this)) toast("Butuh Shizuku. Lihat tab AKTIVASI.")
            else {
                val app = applicationContext
                Thread { Opt.restore(app); Opt.apply(app, s, null); runOnUiThread { toast("Diterapkan.") } }.start()
            }
        }, lp(-1, -2, 8))
        col.addView(rogBtn("BERSIHKAN RAM SEKARANG", false) { if (ready) Opt.clean(this) { toast(it) } else toast("Butuh Shizuku.") }, lp(-1, -2, 8))
        col.addView(rogBtn("BERI IZIN OTOMATIS (Shizuku)", false) { if (ready) Opt.grantAll(this) { toast(it) } else toast("Butuh Shizuku.") }, lp(-1, -2, 8))
        col.addView(rogBtn("PULIHKAN PENGATURAN SISTEM", false) {
            val app = applicationContext
            Thread { Opt.restore(app); runOnUiThread { toast("Pengaturan sistem dipulihkan.") } }.start()
        }, lp(-1, -2, 8))
        col.addView(label("Pengaturan kembali otomatis saat Game Turbo dimatikan. Kalau ada yang terasa aneh, tekan PULIHKAN.", 11f, C.HOT), lp(-1, -2, 10))
    }

    // ================= AKTIVASI =================
    private fun methodCard(col: LinearLayout, title: String, tag: String?, steps: String, build: (LinearLayout) -> Unit) {
        val c = card()
        c.addView(label(title + (if (tag != null) "   [" + tag + "]" else ""), 15f, Color.WHITE, true, true))
        c.addView(label("CARA PAKAI", 11f, C.CYAN, true), lp(-1, -2, 8))
        c.addView(label(steps, 12f, C.MUTE), lp(-1, -2, 4))
        build(c)
        col.addView(c, lp(-1, -2, 12))
    }

    private fun buildActivation(col: LinearLayout) {
        header(col, "AKTIVASI SHIZUKU")
        val alive = Shz.alive()
        val ready = Shz.ready()
        val st = card()
        st.addView(label(if (ready) "TERHUBUNG" else if (alive) "SHIZUKU JALAN, IZIN BELUM" else "SHIZUKU BELUM AKTIF", 16f, if (ready) C.GREEN else C.HOT, true, true))
        st.addView(label("Shizuku adalah izin khusus yang membuka keymap, pembersih RAM, grafik, dan CPU persen. Fitur dasar (crosshair, menu, pantau) tetap jalan tanpa ini.", 12f, C.MUTE))
        st.addView(label("Disarankan untuk HP kamu (Android " + Build.VERSION.RELEASE + "): " + (if (Build.VERSION.SDK_INT >= 30) "Metode 1 (Debugging Nirkabel)" else "Metode 2 (lewat komputer)"), 12f, C.CYAN, true), lp(-1, -2, 8))
        st.addView(rogBtn("CEK STATUS", true) { goSub(1) }, lp(-1, -2, 10))
        if (alive && !ready) st.addView(rogBtn("IZINKAN SHIZUKU", true) { Shz.request() }, lp(-1, -2, 8))
        col.addView(st, lp(-1, -2, 14))

        col.addView(section("PILIH METODE"), lp(-2, -2, 20))
        methodCard(col, "1. Debugging Nirkabel", if (Build.VERSION.SDK_INT >= 30) "DISARANKAN" else "Android 11+",
            "Tanpa komputer. Butuh Android 11 ke atas dan Wi-Fi.\n1. Pasang aplikasi Shizuku (Play Store atau GitHub RikkaApps/Shizuku).\n2. Sambungkan HP ke Wi-Fi.\n3. Pengaturan > Tentang ponsel > ketuk Nomor build 7 kali sampai mode pengembang aktif.\n4. Buka Opsi pengembang, nyalakan Debugging nirkabel (izinkan jaringan Wi-Fi ini).\n5. Buka Shizuku > Mulai lewat debugging nirkabel > Pairing. Ketuk pasangkan dengan kode, lalu masukkan kode dari notifikasi.\n6. Kembali ke Shizuku dan ketuk Mulai. Statusnya jadi sedang berjalan.\n7. Buka ELAINA dan ketuk IZINKAN SHIZUKU.\nSetelah HP restart, cukup ulangi langkah 6.") { c ->
            c.addView(rogBtn("BUKA OPSI PENGEMBANG", false) {
                try { startActivity(Intent(Settings.ACTION_APPLICATION_DEVELOPMENT_SETTINGS)) } catch (e: Exception) { toast("Aktifkan mode pengembang lewat Tentang ponsel > Nomor build.") }
            }, lp(-1, -2, 8))
            c.addView(rogBtn("BUKA SHIZUKU", false) { openShizuku() }, lp(-1, -2, 8))
            c.addView(rogBtn("IZINKAN SHIZUKU", true) { if (Shz.alive()) Shz.request() else toast("Shizuku belum berjalan. Nyalakan dulu di aplikasi Shizuku.") }, lp(-1, -2, 8))
        }
        methodCard(col, "2. Lewat komputer (kabel USB)", if (Build.VERSION.SDK_INT < 30) "DISARANKAN" else "Semua Android",
            "Untuk Android 10 ke bawah atau kalau debugging nirkabel tidak ada.\n1. Pasang aplikasi Shizuku di HP.\n2. Nyalakan Debugging USB di Opsi pengembang.\n3. Sambungkan HP ke komputer dengan kabel dan izinkan debugging.\n4. Di komputer (sudah ada ADB/platform-tools) jalankan perintah di bawah.\n5. Tunggu tulisan shizuku_starter exit with 0.\n6. Buka ELAINA dan ketuk IZINKAN SHIZUKU.\nUlangi perintah setiap HP restart.") { c ->
            c.addView(rogBtn("SALIN PERINTAH ADB", true) { copyText("adb shell sh /sdcard/Android/data/moe.shizuku.privileged.api/start.sh") }, lp(-1, -2, 8))
            c.addView(rogBtn("IZINKAN SHIZUKU", false) { if (Shz.alive()) Shz.request() else toast("Shizuku belum berjalan.") }, lp(-1, -2, 8))
        }
        methodCard(col, "3. Root", "HP sudah root",
            "1. Pasang aplikasi Shizuku.\n2. Buka Shizuku, ketuk Mulai (root).\n3. Izinkan akses root saat diminta.\n4. Buka ELAINA dan ketuk IZINKAN SHIZUKU.") { c ->
            c.addView(rogBtn("BUKA SHIZUKU", false) { openShizuku() }, lp(-1, -2, 8))
        }
        val sec = Opt.secureOk(this)
        methodCard(col, "4. HP tidak mendukung Shizuku", "tanpa Shizuku",
            "Yang tetap jalan tanpa Shizuku: crosshair (semua bentuk dan foto), menu melayang, pantau RAM/baterai/ping, screenshot lewat rekam layar, mode fokus.\nYang butuh Shizuku: keymap, bersihkan RAM, resolusi/refresh rate, CPU persen.\nOpsi tanpa Shizuku (butuh komputer sekali): beri izin lewat ADB.\n1. Nyalakan Debugging USB dan sambungkan ke komputer.\n2. Jalankan perintah di bawah.\n3. Animasi sistem sekarang bisa dipercepat atau dimatikan saat game lewat tab OPTIMASI.\nIzin ini tetap ada sampai aplikasi dihapus.") { c ->
            c.addView(label("Izin WRITE_SECURE_SETTINGS: " + (if (sec) "AKTIF" else "BELUM"), 12f, if (sec) C.GREEN else C.HOT, true), lp(-1, -2, 8))
            c.addView(rogBtn("SALIN PERINTAH ADB", true) { copyText("adb shell pm grant " + packageName + " android.permission.WRITE_SECURE_SETTINGS") }, lp(-1, -2, 8))
        }
        col.addView(label("Kalau Shizuku mati sendiri setelah HP restart atau lama tidak dipakai, ulangi langkah Mulai di aplikasi Shizuku.", 11f, C.MUTE), lp(-1, -2, 8))
    }

    // ================= LAINNYA (hub) =================
    private var sub = 0

    private fun goSub(n: Int) { sub = n; showTab(4) }

    private fun hubRow(col: LinearLayout, title: String, desc: String, n: Int) {
        val r = LinearLayout(this)
        r.gravity = Gravity.CENTER_VERTICAL
        r.setPadding(dp(16), dp(16), dp(16), dp(16))
        r.background = Chamfer(C.PANEL, C.RED, dp(12).toFloat(), 2f)
        val c = LinearLayout(this)
        c.orientation = LinearLayout.VERTICAL
        c.addView(label(title, 16f, Color.WHITE, true, true))
        c.addView(label(desc, 12f, C.MUTE))
        r.addView(c, LinearLayout.LayoutParams(0, -2, 1f))
        r.addView(label(">", 20f, C.RED, true))
        r.setOnClickListener { goSub(n) }
        col.addView(r, lp(-1, -2, 10))
    }

    private fun buildMore(col: LinearLayout) {
        if (sub == 0) {
            header(col, "LAINNYA")
            hubRow(col, "AKTIVASI SHIZUKU", "cara mengaktifkan, 4 metode", 1)
            hubRow(col, "INFO & PANDUAN", "daftar siap main, cara pakai, menu hilang", 2)
            hubRow(col, "PENGATURAN", "bentuk gambar, mode fokus, reset", 3)
            hubRow(col, "HUBUNGI DEVELOPER", "kirim saran atau laporan masalah", 4)
            col.addView(label("ELAINA Optimasi v4", 11f, C.MUTE), lp(-1, -2, 20))
            return
        }
        col.addView(rogBtn("< KEMBALI", false) { goSub(0) })
        when (sub) {
            1 -> buildActivation(col)
            2 -> buildInfo(col)
            3 -> buildSettings(col)
            else -> buildContact(col)
        }
    }

    private fun buildSettings(col: LinearLayout) {
        header(col, "PENGATURAN")
        col.addView(section("BENTUK GAMBAR"), lp(-2, -2, 24))
        col.addView(label("Berlaku untuk semua gambar di aplikasi: foto profil, ikon game, dan lainnya.", 12f, C.MUTE), lp(-1, -2, 8))
        col.addView(chipRow("imgShape", listOf("Lingkaran", "Kotak"), false) { goSub(3) }, lp(-1, -2, 10))
        val av = ShapeImageView(this, s)
        av.setImageResource(R.drawable.elaina)
        col.addView(av, lp(dp(96), dp(96), 12))

        col.addView(section("MODE FOKUS & SCREENSHOT"), lp(-2, -2, 24))
        col.addView(check("Mode fokus (bungkam notifikasi saat main)", "focus"), lp(-1, -2, 8))
        col.addView(check("Screenshot lewat rekam layar (tanpa Shizuku)", "shot"))
        col.addView(check("Efek suara (SE)", "sfx"))
        col.addView(section("MENU DI GAME"), lp(-2, -2, 24))
        col.addView(rogBtn("RESET POSISI MENU", false) {
            s.set("pX", 0); s.set("pY", 200)
            OverlayService.instance?.moveTo()
            toast("Posisi menu dikembalikan.")
        }, lp(-1, -2, 8))
        col.addView(rogBtn("RESET SEMUA PENGATURAN", false) {
            s.reset()
            File(filesDir, "cut.png").delete()
            File(filesDir, "src.png").delete()
            OverlayService.instance?.refresh()
            goSub(3)
        }, lp(-1, -2, 12))
            }

    private fun field(hint: String, lines: Int): EditText {
        val et = EditText(this)
        et.hint = hint
        et.setTextColor(C.TEXT)
        et.setHintTextColor(C.MUTE)
        et.textSize = 14f
        et.setPadding(dp(12), dp(10), dp(12), dp(10))
        et.background = Chamfer(C.PANEL2, C.LINE, dp(8).toFloat())
        if (lines > 1) { et.minLines = lines; et.gravity = Gravity.TOP; et.inputType = android.text.InputType.TYPE_CLASS_TEXT or android.text.InputType.TYPE_TEXT_FLAG_MULTI_LINE }
        return et
    }

    private fun buildContact(col: LinearLayout) {
        header(col, "HUBUNGI DEVELOPER")
        col.addView(label("Kirim saran, laporan error, atau pertanyaan. Pesan dikirim ke email developer.", 13f, C.MUTE), lp(-1, -2, 12))
        val name = field("Nama (boleh kosong)", 1)
        val contact = field("Kontak balasan: email atau WhatsApp (boleh kosong)", 1)
        val msg = field("Tulis pesanmu di sini (minimal 10 huruf)", 5)
        col.addView(name, lp(-1, -2, 8))
        col.addView(contact, lp(-1, -2, 8))
        col.addView(msg, lp(-1, -2, 8))
        var info = true
        col.addView(toggleRow("Sertakan info perangkat (model, Android)", true) { info = it }, lp(-1, -2, 10))
        col.addView(rogBtn("KIRIM PESAN", true) {
            val m = msg.text.toString()
            Mail.send(name.text.toString(), contact.text.toString(), m, info) { ok, text ->
                toast(text)
                if (ok) msg.setText("")
            }
        }, lp(-1, -2, 12))
        col.addView(rogBtn("KIRIM LEWAT APLIKASI EMAIL", false) {
            try { startActivity(Intent.createChooser(Mail.viaEmailApp(msg.text.toString(), info), "Kirim email")) }
            catch (e: Exception) { toast("Tidak ada aplikasi email.") }
        }, lp(-1, -2, 8))
        col.addView(label("Pesan dikirim lewat layanan formulir pihak ketiga (FormSubmit) ke " + Mail.TO + ". Jangan kirim sandi atau data pribadi yang sensitif. Kalau kirim langsung gagal, pakai tombol aplikasi email.", 11f, C.MUTE), lp(-1, -2, 12))
    }

    // ================= INFO =================
    private fun buildInfo(col: LinearLayout) {
        header(col, "INFO & PENGATURAN")
        col.addView(section("SIAP MAIN? PERIKSA DULU"), lp(-2, -2, 18))
        statusRow(col, "Tampil di atas aplikasi lain", Settings.canDrawOverlays(this), "BERI IZIN") {
            startActivity(Intent(Settings.ACTION_MANAGE_OVERLAY_PERMISSION, Uri.parse("package:$packageName")))
        }
        val pw = getSystemService(PowerManager::class.java)
        statusRow(col, "Penghemat baterai dimatikan", pw.isIgnoringBatteryOptimizations(packageName), "MATIKAN PENGHEMAT BATERAI") {
            try { startActivity(Intent(Settings.ACTION_REQUEST_IGNORE_BATTERY_OPTIMIZATIONS, Uri.parse("package:$packageName"))) }
            catch (e: Exception) { toast("Buka Setelan > Baterai > ELAINA > Tanpa batasan.") }
        }
        val c1 = card(12)
        c1.addView(label("Izin jendela pop-up di latar belakang", 14f, Color.WHITE, true))
        c1.addView(label("Wajib untuk HP Xiaomi/Redmi/POCO supaya menu tidak hilang di dalam game. Di halaman yang terbuka: Izin lainnya > Tampilkan jendela pop-up saat berjalan di latar belakang > Izinkan. Aktifkan juga Mulai otomatis. HP merek lain biasanya cukup dengan izin di atas.", 12f, C.MUTE), lp(-1, -2, 4))
        c1.addView(rogBtn("BUKA HALAMAN IZIN APLIKASI", true) {
            startActivity(Intent(Settings.ACTION_APPLICATION_DETAILS_SETTINGS, Uri.parse("package:$packageName")))
        }, lp(-1, -2, 8))
        col.addView(c1, lp(-1, -2, 8))
        statusRow(col, "Shizuku terhubung (keymap, optimasi, CPU %)", Shz.ready(), "KE TAB AKTIVASI") { goSub(1) }
        val nm = getSystemService(NotificationManager::class.java)
        statusRow(col, "Jangan Ganggu untuk mode fokus (opsional)", nm.isNotificationPolicyAccessGranted, "BERI IZIN") {
            startActivity(Intent(Settings.ACTION_NOTIFICATION_POLICY_ACCESS_SETTINGS))
        }

        col.addView(section("CARA MAIN"), lp(-2, -2, 22))
        col.addView(label("1. Pastikan daftar di atas [OK].\n2. Tab TURBO: pilih game lalu tekan START.\n3. Di dalam game muncul crosshair dan ikon bulat Elaina.\n4. Ketuk ikon Elaina untuk membuka menu. Tahan lalu geser untuk memindahkan.\n5. Menu punya halaman: CROSSHAIR, KEYMAP, GRAFIK, ALAT, INFO. Tombol < kembali ke halaman utama.\n6. Mematikan: tombol BERHENTI di menu atau MATIKAN di notifikasi.", 12f, C.MUTE), lp(-1, -2, 8))
        col.addView(section("MENU HILANG SENDIRI?"), lp(-2, -2, 22))
        col.addView(label("Coba berurutan:\n1. Matikan penghemat baterai (daftar di atas).\n2. Xiaomi: izinkan jendela pop-up di latar belakang dan Mulai otomatis.\n3. Kunci ELAINA di layar Recent (tahan kartunya, pilih Kunci).\n4. Jangan geser ELAINA keluar dari Recent saat main.\n5. Dengan Shizuku: tab OPTIMASI > BERI IZIN OTOMATIS.\nMenu otomatis dipasang ulang bila sistem melepasnya. Sebagian game memang memblokir overlay.", 12f, C.MUTE), lp(-1, -2, 8))

        col.addView(rogBtn("HUBUNGI DEVELOPER", false) { goSub(4) }, lp(-1, -2, 20))
        col.addView(label("ELAINA Optimasi v4", 11f, C.MUTE), lp(-1, -2, 12))
    }

    // ================= PEMBANTU UI & FOTO =================
    private fun chipRow(key: String, items: List<String>, reproc: Boolean, after: (() -> Unit)?): View {
        val hs = HorizontalScrollView(this)
        hs.isHorizontalScrollBarEnabled = false
        val row = LinearLayout(this)
        val chips = ArrayList<TextView>()
        fun paint() {
            for (k in chips.indices) {
                val on = s.i(key) == k
                chips[k].setTextColor(if (on) Color.WHITE else C.MUTE)
                chips[k].background = if (on) Chamfer(C.RED, 0, dp(8).toFloat(), 0f) else Chamfer(C.PANEL2, C.LINE, dp(8).toFloat())
            }
        }
        for (k in items.indices) {
            val t = label(items[k], 14f, C.MUTE, true)
            t.setPadding(dp(16), dp(10), dp(16), dp(10))
            t.setOnClickListener {
                s.set(key, k)
                paint()
                if (reproc) reprocess() else apply()
                after?.invoke()
            }
            chips.add(t)
            row.addView(t, LinearLayout.LayoutParams(-2, -2).also { it.rightMargin = dp(8) })
        }
        paint()
        hs.addView(row)
        return hs
    }

    private fun colors(): View {
        val col = LinearLayout(this)
        col.orientation = LinearLayout.VERTICAL
        val row = LinearLayout(this)
        val list = intArrayOf(0xFF39FF88.toInt(), 0xFFFF1744.toInt(), 0xFFFFE600.toInt(), 0xFF00E5FF.toInt(),
            0xFFFF4DFF.toInt(), 0xFFFFFFFF.toInt(), 0xFF000000.toInt())
        for (c in list) {
            val v = View(this)
            val g = GradientDrawable()
            g.shape = GradientDrawable.OVAL
            g.setColor(c)
            g.setStroke(dp(2), C.LINE)
            v.background = g
            v.setOnClickListener { s.set("color", c); apply() }
            row.addView(v, LinearLayout.LayoutParams(0, dp(40), 1f).also { it.setMargins(dp(3), 0, dp(3), 0) })
        }
        col.addView(row)
        col.addView(label("Geser untuk warna lain", 12f, C.MUTE), lp(-1, -2, 8))
        val hue = SeekBar(this)
        hue.max = 360
        hue.progressTintList = ColorStateList.valueOf(C.RED)
        hue.thumbTintList = ColorStateList.valueOf(C.RED)
        hue.setOnSeekBarChangeListener(object : SeekBar.OnSeekBarChangeListener {
            override fun onProgressChanged(bar: SeekBar?, p: Int, user: Boolean) {
                if (user) { s.set("color", Color.HSVToColor(floatArrayOf(p.toFloat(), 1f, 1f))); apply() }
            }
            override fun onStartTrackingTouch(bar: SeekBar?) {}
            override fun onStopTrackingTouch(bar: SeekBar?) {}
        })
        col.addView(hue)
        return col
    }

    private fun seek(name: String, key: String, lo: Int, hi: Int, reproc: Boolean): View {
        val col = LinearLayout(this)
        col.orientation = LinearLayout.VERTICAL
        val tv = label("", 13f, C.TEXT, true)
        fun upd() { tv.text = name + ":  " + s.i(key) }
        upd()
        val sb = SeekBar(this)
        sb.max = hi - lo
        sb.progress = (s.i(key) - lo).coerceIn(0, hi - lo)
        sb.progressTintList = ColorStateList.valueOf(C.RED)
        sb.thumbTintList = ColorStateList.valueOf(C.RED)
        sb.setOnSeekBarChangeListener(object : SeekBar.OnSeekBarChangeListener {
            override fun onProgressChanged(bar: SeekBar?, p: Int, user: Boolean) {
                s.set(key, p + lo); upd(); if (!reproc) apply()
            }
            override fun onStartTrackingTouch(bar: SeekBar?) {}
            override fun onStopTrackingTouch(bar: SeekBar?) { if (reproc) reprocess() }
        })
        col.addView(tv)
        col.addView(sb)
        return col
    }

    private fun check(text: String, key: String): CheckBox {
        val c = CheckBox(this)
        c.text = text
        c.setTextColor(C.TEXT)
        c.buttonTintList = ColorStateList.valueOf(C.RED)
        c.isChecked = s.b(key)
        c.setOnCheckedChangeListener { _, v -> s.set(key, if (v) 1 else 0); apply() }
        return c
    }

    private fun maskRow(): View {
        val hs = HorizontalScrollView(this)
        hs.isHorizontalScrollBarEnabled = false
        val row = LinearLayout(this)
        val names = listOf("Plus", "X", "Cincin", "Titik", "Sudut", "Delta")
        val bits = intArrayOf(1, 2, 4, 8, 16, 32)
        val chips = ArrayList<TextView>()
        val paint = {
            for (k in chips.indices) {
                val on = (s.i("mask") and bits[k]) != 0
                chips[k].setTextColor(if (on) Color.WHITE else C.MUTE)
                chips[k].background = if (on) Chamfer(C.RED, 0, dp(8).toFloat(), 0f) else Chamfer(C.PANEL2, C.LINE, dp(8).toFloat())
            }
        }
        for (k in names.indices) {
            val t = label(names[k], 14f, C.MUTE, true)
            t.setPadding(dp(16), dp(10), dp(16), dp(10))
            t.setOnClickListener { s.set("mask", s.i("mask") xor bits[k]); paint(); apply() }
            chips.add(t)
            row.addView(t, LinearLayout.LayoutParams(-2, -2).also { it.rightMargin = dp(8) })
        }
        paint()
        paintMask = paint
        hs.addView(row)
        return hs
    }

    private fun presetRow(): View {
        val hs = HorizontalScrollView(this)
        hs.isHorizontalScrollBarEnabled = false
        val row = LinearLayout(this)
        val names = listOf("Klasik", "Titik", "Sniper", "Siku", "Delta", "X+Titik", "Radar", "Gabungan")
        val vals = intArrayOf(1, 8, 13, 24, 40, 10, 14, 29)
        for (k in names.indices) {
            val t = label(names[k], 13f, C.CYAN, true)
            t.setPadding(dp(14), dp(9), dp(14), dp(9))
            t.background = Chamfer(C.PANEL2, C.CYAN, dp(8).toFloat(), 2f)
            t.setOnClickListener { s.set("mask", vals[k]); paintMask?.invoke(); apply() }
            row.addView(t, LinearLayout.LayoutParams(-2, -2).also { it.rightMargin = dp(8) })
        }
        hs.addView(row)
        return hs
    }

    private fun openShizuku() {
        val li = packageManager.getLaunchIntentForPackage("moe.shizuku.privileged.api")
        if (li != null) startActivity(li) else toast("Aplikasi Shizuku belum terpasang. Pasang dari Play Store atau GitHub Shizuku.")
    }

    private fun loadPhoto(u: Uri) {
        ex.execute {
            try {
                val o = BitmapFactory.Options()
                o.inJustDecodeBounds = true
                contentResolver.openInputStream(u)?.use { BitmapFactory.decodeStream(it, null, o) }
                var ss = 1
                while (maxOf(o.outWidth, o.outHeight) / ss > 1100) ss *= 2
                val o2 = BitmapFactory.Options()
                o2.inSampleSize = ss
                var bmp: Bitmap = contentResolver.openInputStream(u)?.use { BitmapFactory.decodeStream(it, null, o2) }
                    ?: throw Exception("decode")
                val deg = try {
                    contentResolver.openInputStream(u)?.use {
                        when (ExifInterface(it).getAttributeInt(ExifInterface.TAG_ORIENTATION, 1)) {
                            6 -> 90
                            3 -> 180
                            8 -> 270
                            else -> 0
                        }
                    } ?: 0
                } catch (e: Exception) { 0 }
                if (deg != 0) {
                    val m = Matrix()
                    m.postRotate(deg.toFloat())
                    bmp = Bitmap.createBitmap(bmp, 0, 0, bmp.width, bmp.height, m, true)
                }
                val big = maxOf(bmp.width, bmp.height)
                if (big > 560) {
                    val k = 560f / big
                    bmp = Bitmap.createScaledBitmap(bmp, (bmp.width * k).toInt().coerceAtLeast(1), (bmp.height * k).toInt().coerceAtLeast(1), true)
                }
                FileOutputStream(File(filesDir, "src.png")).use { bmp.compress(Bitmap.CompressFormat.PNG, 100, it) }
                s.set("hasBg", 0)
                s.set("usePhoto", 1)
                doProcess()
                runOnUiThread { if (tab == 1) showTab(1) }
            } catch (e: Exception) {
                runOnUiThread { toast("Foto tidak bisa dibuka. Coba foto JPG atau PNG lain.") }
            }
        }
    }

    private fun reprocess() { ex.execute { doProcess() } }

    private fun doProcess() {
        try {
            val f = File(filesDir, "src.png")
            if (!f.exists()) return
            val src = BitmapFactory.decodeFile(f.path) ?: return
            val bg = if (s.b("hasBg")) s.i("bgColor") else null
            val r = Bg.process(src, s.i("tol"), s.i("feather"), s.i("mode"), bg)
            val cut = r.second
            val cf = File(filesDir, "cut.png")
            if (cut != null) FileOutputStream(cf).use { cut.compress(Bitmap.CompressFormat.PNG, 100, it) } else cf.delete()
            runOnUiThread {
                pick?.bmp = r.first
                pick?.invalidate()
                preview?.photo = cut
                preview2?.photo = cut
                if (cut == null) toast("Semua area terhapus. Turunkan toleransi atau pilih warna latar lain.")
                apply()
            }
        } catch (e: Exception) {
            runOnUiThread { toast("Gagal memproses foto.") }
        }
    }

    private fun pickBg(x: Int, y: Int) {
        ex.execute {
            val src = BitmapFactory.decodeFile(File(filesDir, "src.png").path) ?: return@execute
            s.set("bgColor", src.getPixel(x.coerceIn(0, src.width - 1), y.coerceIn(0, src.height - 1)))
            s.set("hasBg", 1)
            doProcess()
        }
    }
}
__XH_EOF__
mkdir -p "app/src/main/java/com/crosshair/pro"
cat > "app/src/main/java/com/crosshair/pro/OverlayService.kt" <<'__XH_EOF__'
package com.crosshair.pro

import android.app.*
import android.content.BroadcastReceiver
import android.content.ContentValues
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.content.pm.ServiceInfo
import android.content.res.Configuration
import android.graphics.Bitmap
import android.graphics.Color
import android.graphics.PixelFormat
import android.graphics.drawable.GradientDrawable
import android.graphics.drawable.Icon
import android.hardware.display.DisplayManager
import android.hardware.display.VirtualDisplay
import android.media.Image
import android.media.ImageReader
import android.media.projection.MediaProjection
import android.media.projection.MediaProjectionManager
import android.os.Build
import android.os.Handler
import android.os.IBinder
import android.os.Looper
import android.os.SystemClock
import android.provider.MediaStore
import android.util.DisplayMetrics
import android.view.Display
import android.view.Gravity
import android.view.MotionEvent
import android.view.View
import android.view.ViewConfiguration
import android.view.WindowManager
import android.widget.LinearLayout
import android.widget.ScrollView
import android.widget.TextView
import android.widget.Toast

class OverlayService : Service() {
    companion object { @JvmField var instance: OverlayService? = null }

    private val h = Handler(Looper.getMainLooper())
    private lateinit var wm: WindowManager
    private lateinit var s: Spec
    private var xh: CrosshairView? = null
    private var root: LinearLayout? = null
    private var scroll: ScrollView? = null
    private var body: LinearLayout? = null
    private var plp: WindowManager.LayoutParams? = null
    private var ramT: TextView? = null
    private var cpuT: TextView? = null
    private var batT: TextView? = null
    private var pingT: TextView? = null
    private var ramBar: Bar? = null
    private var ovBtn: TextView? = null
    private var focusBtn: TextView? = null
    private var kmStatT: TextView? = null
    private var kmOnBtn: TextView? = null
    private var kmEditBtn: TextView? = null
    private var km: KeyLayer? = null
    private val chips = ArrayList<TextView>()
    private val tabViews = ArrayList<TextView>()
    private val tabBodies = ArrayList<LinearLayout>()
    private val bits = intArrayOf(1, 2, 4, 8, 16, 32)
    private var open = false
    private var added = false
    private var tickN = 0
    private var prevFilter = -1
    private var projection: MediaProjection? = null
    private var vd: VirtualDisplay? = null
    private var reader: ImageReader? = null
    private var shotBusy = false
    private var closing = false

    private val screenOn = object : BroadcastReceiver() {
        override fun onReceive(c: Context?, i: Intent?) { h.postDelayed({ watchdog() }, 600) }
    }

    private val tick = object : Runnable {
        override fun run() {
            watchdog()
            autoCleanTick()
            if (open && s.i("ppage") == 4) updateStats()
            h.postDelayed(this, 1500)
        }
    }

    override fun onBind(i: Intent?): IBinder? = null

    override fun onCreate() {
        super.onCreate()
        instance = this
        s = Spec(this)
        wm = getSystemService(WINDOW_SERVICE) as WindowManager
        try { registerReceiver(screenOn, IntentFilter(Intent.ACTION_SCREEN_ON)) } catch (e: Exception) { }
    }

    override fun onStartCommand(i: Intent?, f: Int, id: Int): Int {
        if (i?.action == "STOP") { stopSelf(); return START_NOT_STICKY }
        val code = i?.getIntExtra("code", 0) ?: 0
        @Suppress("DEPRECATION")
        val data: Intent? = i?.getParcelableExtra("data")
        val proj = data != null && code == Activity.RESULT_OK
        startFg(proj)
        if (!added) {
            addViews(true)
            applyFocus(s.b("focus"))
            h.removeCallbacks(tick)
            h.postDelayed(tick, 1500)
        }
        if (proj && projection == null && data != null) initProjection(code, data)
        return START_STICKY
    }

    override fun onTaskRemoved(rootIntent: Intent?) {
        try {
            val pi = PendingIntent.getForegroundService(applicationContext, 7, Intent(applicationContext, OverlayService::class.java),
                PendingIntent.FLAG_ONE_SHOT or PendingIntent.FLAG_IMMUTABLE)
            getSystemService(AlarmManager::class.java).set(AlarmManager.ELAPSED_REALTIME, SystemClock.elapsedRealtime() + 1500, pi)
        } catch (e: Exception) { }
        super.onTaskRemoved(rootIntent)
    }

    override fun onConfigurationChanged(c: Configuration) {
        super.onConfigurationChanged(c)
        h.postDelayed({ refresh(); clamp(); km?.relayout(); if (open) fitScroll() }, 400)
    }

    private fun toast(t: String) { h.post { Toast.makeText(this, t, Toast.LENGTH_LONG).show() } }

    private fun screen(): DisplayMetrics {
        val dm = DisplayMetrics()
        getSystemService(DisplayManager::class.java).getDisplay(Display.DEFAULT_DISPLAY).getRealMetrics(dm)
        return dm
    }

    private fun startFg(proj: Boolean) {
        val nm = getSystemService(NotificationManager::class.java)
        nm.createNotificationChannel(NotificationChannel("xh", "ELAINA Game Turbo", NotificationManager.IMPORTANCE_LOW))
        val openPi = PendingIntent.getActivity(this, 0, Intent(this, MainActivity::class.java), PendingIntent.FLAG_IMMUTABLE)
        val stop = PendingIntent.getService(this, 1, Intent(this, OverlayService::class.java).setAction("STOP"), PendingIntent.FLAG_IMMUTABLE)
        val n = Notification.Builder(this, "xh")
            .setSmallIcon(R.drawable.ic_stat)
            .setContentTitle("ELAINA Game Turbo aktif")
            .setContentText("Ketuk untuk membuka aplikasi")
            .setContentIntent(openPi)
            .setOngoing(true)
            .addAction(Notification.Action.Builder(Icon.createWithResource(this, R.drawable.ic_stat), "Matikan", stop).build())
            .build()
        if (Build.VERSION.SDK_INT >= 34) {
            var t = ServiceInfo.FOREGROUND_SERVICE_TYPE_SPECIAL_USE
            if (proj) t = t or ServiceInfo.FOREGROUND_SERVICE_TYPE_MEDIA_PROJECTION
            startForeground(1, n, t)
        } else if (proj) {
            startForeground(1, n, ServiceInfo.FOREGROUND_SERVICE_TYPE_MEDIA_PROJECTION)
        } else {
            startForeground(1, n)
        }
    }

    // ================= jendela overlay =================
    private fun addViews(first: Boolean) {
        try {
            val d = resources.displayMetrics.density
            val size = ((if (s.b("usePhoto")) 420 else 300) * d).toInt()
            val v = CrosshairView(this, s)
            v.photo = Store.cut(this)
            val lp = WindowManager.LayoutParams(
                size, size, WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY,
                WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE or WindowManager.LayoutParams.FLAG_NOT_TOUCHABLE or
                    WindowManager.LayoutParams.FLAG_LAYOUT_IN_SCREEN or WindowManager.LayoutParams.FLAG_LAYOUT_NO_LIMITS,
                PixelFormat.TRANSLUCENT
            )
            lp.gravity = Gravity.CENTER
            lp.x = (s.i("offX") * d).toInt()
            lp.y = (s.i("offY") * d).toInt()
            wm.addView(v, lp)
            xh = v
            v.visibility = if (s.b("ovOn")) View.VISIBLE else View.INVISIBLE

            open = false
            if (km == null) {
                val k = KeyLayer(this, wm) { screen() }
                k.onEditChange = { h.post { paintKm() } }
                km = k
            }
            buildPanel()
            val pl = WindowManager.LayoutParams(
                WindowManager.LayoutParams.WRAP_CONTENT, WindowManager.LayoutParams.WRAP_CONTENT,
                WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY,
                WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE or WindowManager.LayoutParams.FLAG_LAYOUT_NO_LIMITS,
                PixelFormat.TRANSLUCENT
            )
            pl.gravity = Gravity.TOP or Gravity.START
            pl.x = (s.i("pX") * d).toInt()
            pl.y = (s.i("pY") * d).toInt()
            plp = pl
            wm.addView(root, pl)
            added = true
            h.postDelayed({ clamp() }, 400)
            if (s.b("kmOn") && km?.shown != true) startKm(false)
        } catch (e: Exception) {
            detachAll()
            added = false
            if (first) {
                toast("Gagal menampilkan overlay. Pastikan izin Tampil di atas aplikasi lain aktif.")
                stopSelf()
            }
            // saat dipanggil watchdog: jangan berhenti, coba lagi di putaran berikutnya
        }
    }

    private fun detachAll() {
        try { xh?.let { wm.removeViewImmediate(it) } } catch (e: Exception) { }
        try { root?.let { wm.removeViewImmediate(it) } } catch (e: Exception) { }
        xh = null
        root = null
    }

    /** Pasang ulang overlay jika sistem atau game melepasnya. */
    private fun watchdog() {
        if (closing || shotBusy) return
        try {
            if (!added) { addViews(false); return }
            val a = xh
            val r = root
            if ((a != null && !a.isAttachedToWindow) || (r != null && !r.isAttachedToWindow)) {
                detachAll()
                added = false
                addViews(false)
            }
            val k = km
            if (k != null && k.shown && !k.isAttached()) k.reload()
        } catch (e: Exception) { }
    }

    private fun clamp() {
        val r = root ?: return
        val lp = plp ?: return
        val dm = screen()
        val w = if (r.width > 0) r.width else dp(46)
        val hh = if (r.height > 0) r.height else dp(46)
        lp.x = lp.x.coerceIn(0, maxOf(0, dm.widthPixels - w))
        lp.y = lp.y.coerceIn(0, maxOf(0, dm.heightPixels - hh))
        try { wm.updateViewLayout(r, lp) } catch (e: Exception) { }
    }

    private fun fitScroll() {
        val sv = scroll ?: return
        val b = body ?: return
        b.measure(View.MeasureSpec.makeMeasureSpec(dp(300), View.MeasureSpec.EXACTLY), View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.UNSPECIFIED))
        val maxH = minOf((screen().heightPixels * 0.80f).toInt(), dp(560))
        val want = minOf(b.measuredHeight, maxH)
        val lp = sv.layoutParams as LinearLayout.LayoutParams
        if (lp.height != want) { lp.height = want; sv.layoutParams = lp }
    }

    fun moveTo() {
        val lp = plp ?: return
        val d = resources.displayMetrics.density
        lp.x = (s.i("pX") * d).toInt()
        lp.y = (s.i("pY") * d).toInt()
        clamp()
    }

    fun refresh() {
        val v = xh ?: return
        val d = resources.displayMetrics.density
        v.photo = Store.cut(this)
        v.visibility = if (s.b("ovOn")) View.VISIBLE else View.INVISIBLE
        try {
            val lp = v.layoutParams as WindowManager.LayoutParams
            val want = (if (s.b("usePhoto")) 420 else 300) * d
            lp.width = want.toInt()
            lp.height = want.toInt()
            lp.x = (s.i("offX") * d).toInt()
            lp.y = (s.i("offY") * d).toInt()
            wm.updateViewLayout(v, lp)
        } catch (e: Exception) { }
        v.invalidate()
        paintChips()
        paintToggles()
    }

    fun kmReload() {
        val k = km ?: return
        if (k.shown) k.reload()
        paintKm()
    }

    // ================= panel =================
    private fun paintChips() {
        for (k in chips.indices) {
            val on = (s.i("mask") and bits[k]) != 0 && !s.b("usePhoto")
            chips[k].setTextColor(if (on) Color.WHITE else C.MUTE)
            chips[k].background = if (on) Chamfer(C.RED, 0, dp(6).toFloat(), 0f) else Chamfer(C.PANEL2, C.LINE, dp(6).toFloat())
        }
    }

    private fun paintToggles() {
        ovBtn?.text = if (s.b("ovOn")) "CROSSHAIR: ON" else "CROSSHAIR: OFF"
        focusBtn?.text = if (s.b("focus")) "FOKUS: ON" else "FOKUS: OFF"
    }

    private fun paintKm() {
        val ready = Shz.ready()
        val st = "Shizuku: " + (if (ready) "TERHUBUNG" else "MATI") + "   •   Mesin: " +
            (if (Tap.fast) "CEPAT" else if (ready) "STANDAR" else "-")
        kmStatT?.text = st
        homeStat?.text = st + "   •   Keymap: " + (if (km?.shown == true) "ON" else "OFF")
        kmOnBtn?.text = if (km?.shown == true) "KEYMAP: ON" else "KEYMAP: OFF"
        kmEditBtn?.text = if (km?.edit == true) "SELESAI EDIT" else "EDIT TOMBOL"
    }

    private fun startKm(hint: Boolean) {
        km?.show()
        if (hint && !Shz.ready()) toast("Tombol tampil, tapi ketukan otomatis butuh Shizuku.")
        paintKm()
    }

    private fun resize(d: Int) {
        if (s.b("usePhoto")) { toast("Ukuran foto crosshair diatur di aplikasi ELAINA."); return }
        s.set("len", (s.i("len") + 2 * d).coerceIn(4, 50))
        s.set("th", (s.i("th") + d).coerceIn(1, 12))
        s.set("ring", (s.i("ring") + 2 * d).coerceIn(8, 60))
        s.set("dotSize", (s.i("dotSize") + d).coerceIn(1, 16))
        refresh()
    }

    private fun small(t: TextView): TextView { t.textSize = 12f; return t }

    private val pages = ArrayList<LinearLayout>()
    private var homeV: LinearLayout? = null
    private var homeStat: TextView? = null
    private var titleT: TextView? = null
    private var backBtn: TextView? = null
    private var cleanStatT: TextView? = null
    private var smoothT: TextView? = null
    private var smoothDescT: TextView? = null
    private var lastAuto = 0L
    private val pageNames = listOf("MENU", "CROSSHAIR", "KEYMAP", "GRAFIK & RAM", "ALAT", "INFO")

    private fun sec(t: String): TextView = label(t, 12f, C.CYAN, true)

    private fun svcChips(items: List<String>, get: () -> Int, set: (Int) -> Unit): View {
        val row = LinearLayout(this)
        val tv = ArrayList<TextView>()
        val paint = {
            for (k in tv.indices) {
                val on = get() == k
                tv[k].setTextColor(if (on) Color.WHITE else C.MUTE)
                tv[k].background = if (on) Chamfer(C.RED, 0, dp(6).toFloat(), 0f) else Chamfer(C.PANEL2, C.LINE, dp(6).toFloat())
            }
        }
        for (k in items.indices) {
            val t = label(items[k], 12f, C.MUTE, true)
            t.gravity = Gravity.CENTER
            t.setPadding(dp(2), dp(10), dp(2), dp(10))
            t.setOnClickListener { set(k); paint() }
            tv.add(t)
            row.addView(t, lp(0, -2, 0, 1f).also { it.setMargins(dp(2), 0, dp(2), 0) })
        }
        paint()
        return row
    }

    private fun page(): LinearLayout {
        val t = LinearLayout(this)
        t.orientation = LinearLayout.VERTICAL
        return t
    }

    private fun pageCross(): LinearLayout {
        val t = page()
        t.addView(sec("Bentuk (boleh digabung)"))
        val names = listOf("Plus", "X", "Cincin", "Titik", "Sudut", "Delta")
        for (rowStart in intArrayOf(0, 3)) {
            val sr = LinearLayout(this)
            for (k in rowStart until rowStart + 3) {
                val c = label(names[k], 13f, C.MUTE, true)
                c.gravity = Gravity.CENTER
                c.setPadding(dp(2), dp(11), dp(2), dp(11))
                c.setOnClickListener { s.set("mask", s.i("mask") xor bits[k]); s.set("usePhoto", 0); refresh() }
                chips.add(c)
                sr.addView(c, lp(0, -2, 0, 1f).also { it.setMargins(dp(2), 0, dp(2), 0) })
            }
            t.addView(sr, lp(-1, -2, 6))
        }
        t.addView(sec("Preset"), lp(-1, -2, 14))
        val pr = LinearLayout(this)
        val pn = listOf("Klasik", "Sniper", "Siku", "Gabung")
        val pv = intArrayOf(1, 13, 24, 29)
        for (k in pn.indices) {
            val b = rogBtn(pn[k], false) { s.set("mask", pv[k]); s.set("usePhoto", 0); refresh() }
            b.textSize = 12f
            pr.addView(b, lp(0, -2, 0, 1f).also { it.setMargins(dp(2), 0, dp(2), 0) })
        }
        t.addView(pr, lp(-1, -2, 6))
        t.addView(sec("Warna"), lp(-1, -2, 14))
        val cr = LinearLayout(this)
        val cols = intArrayOf(0xFF39FF88.toInt(), 0xFFFF1744.toInt(), 0xFFFFE600.toInt(), 0xFF00E5FF.toInt(), 0xFFFF4DFF.toInt(), 0xFFFFFFFF.toInt())
        for (c in cols) {
            val v = View(this)
            val g = GradientDrawable()
            g.shape = GradientDrawable.OVAL
            g.setColor(c)
            g.setStroke(dp(2), C.LINE)
            v.background = g
            v.setOnClickListener { s.set("color", c); refresh() }
            cr.addView(v, lp(0, dp(36), 0, 1f).also { it.setMargins(dp(3), 0, dp(3), 0) })
        }
        t.addView(cr, lp(-1, -2, 6))
        t.addView(sec("Ukuran"), lp(-1, -2, 14))
        val sz = LinearLayout(this)
        sz.addView(rogBtn("KECILKAN", false) { resize(-1) }, lp(0, -2, 0, 1f).also { it.rightMargin = dp(4) })
        sz.addView(rogBtn("BESARKAN", false) { resize(1) }, lp(0, -2, 0, 1f).also { it.leftMargin = dp(4) })
        t.addView(sz, lp(-1, -2, 6))
        t.addView(toggleRow("Crosshair tampil", s.b("ovOn")) { s.set("ovOn", if (it) 1 else 0); refresh() }, lp(-1, -2, 14))
        t.addView(label("Foto crosshair hanya bisa diubah di aplikasi ELAINA.", 11f, C.MUTE), lp(-1, -2, 8))
        return t
    }

    private fun pageKeymap(): LinearLayout {
        val t = page()
        kmStatT = label("", 12f, C.CYAN, true)
        t.addView(kmStatT)
        t.addView(toggleRow("Keymap aktif", s.b("kmOn")) { on ->
            s.set("kmOn", if (on) 1 else 0)
            if (on) startKm(true) else { km?.hide(); paintKm() }
        }, lp(-1, -2, 10))
        kmEditBtn = rogBtn("", true) {
            val k = km
            if (k != null) {
                if (!k.shown) { s.set("kmOn", 1); k.show() }
                k.setEdit(!k.edit)
                if (k.edit && open) toggle()
                paintKm()
            }
        }
        t.addView(kmEditBtn, lp(-1, -2, 10))
        t.addView(label("Tahan tombol merah atau tombol volume, titik biru di game diketuk cepat otomatis.\n\nMenambah tombol: EDIT TOMBOL > + TAMBAH > seret tombol merah ke jarimu dan lingkaran biru ke tombol game > pilih pemicu, cara kerja, kecepatan > SELESAI.", 12f, C.MUTE), lp(-1, -2, 12))
        return t
    }

    private fun pageTools(): LinearLayout {
        val t = page()
        ramT = label("RAM", 13f, C.TEXT, true)
        t.addView(ramT)
        ramBar = Bar(this)
        t.addView(ramBar, LinearLayout.LayoutParams(-1, dp(8)).also { it.topMargin = dp(6) })
        cpuT = label("CPU", 13f, C.TEXT, true)
        t.addView(cpuT, lp(-1, -2, 10))
        batT = label("BAT", 13f, C.TEXT, true)
        t.addView(batT, lp(-1, -2, 6))
        pingT = label("PING", 13f, C.TEXT, true)
        t.addView(pingT, lp(-1, -2, 6))
        t.addView(toggleRow("Mode fokus", s.b("focus")) { s.set("focus", if (it) 1 else 0); applyFocus(it) }, lp(-1, -2, 14))
        t.addView(rogBtn("SCREENSHOT", true) { shot() }, lp(-1, -2, 10))
        return t
    }

    private fun gfxApply(resetFirst: Boolean) {
        val app = applicationContext
        if (!Shz.ready() && !Opt.secureOk(app)) toast("Sebagian pengaturan butuh Shizuku (lihat tab LAINNYA > Aktivasi di aplikasi). Bersih RAM tetap jalan.")
        Thread { if (resetFirst) Opt.restore(app); Opt.apply(app, s, null) }.start()
        toast("Diterapkan.")
    }

    private fun updateSmooth() {
        val lv = s.i("smooth")
        smoothT?.text = if (lv <= 0) "Kelicinan: MATI" else "Kelicinan: " + lv + "%"
        smoothDescT?.text = Opt.smoothDesc(lv)
    }

    private fun updateClean() {
        val at = Opt.lastCleanAt
        cleanStatT?.text = if (at == 0L) "Belum pernah dibersihkan." else
            "Terakhir: " + java.text.SimpleDateFormat("HH:mm:ss", java.util.Locale.getDefault()).format(java.util.Date(at)) + "  (sekitar " + Opt.lastFreed + " MB)"
    }

    private fun pageGfx(): LinearLayout {
        val t = page()
        t.addView(sec("Pelicin layar"))
        smoothT = label("", 17f, Color.WHITE, true, true)
        t.addView(smoothT, lp(-1, -2, 6))
        val sb = android.widget.SeekBar(this)
        sb.max = 100
        sb.progress = s.i("smooth")
        sb.progressTintList = android.content.res.ColorStateList.valueOf(C.RED)
        sb.thumbTintList = android.content.res.ColorStateList.valueOf(C.RED)
        sb.setOnSeekBarChangeListener(object : android.widget.SeekBar.OnSeekBarChangeListener {
            override fun onProgressChanged(bar: android.widget.SeekBar?, p: Int, user: Boolean) {
                if (user) { Opt.smooth(s, p); updateSmooth() }
            }
            override fun onStartTrackingTouch(bar: android.widget.SeekBar?) {}
            override fun onStopTrackingTouch(bar: android.widget.SeekBar?) {}
        })
        t.addView(sb, lp(-1, -2, 4))
        smoothDescT = label("", 11f, C.MUTE)
        t.addView(smoothDescT, lp(-1, -2, 4))
        val pr = LinearLayout(this)
        val pn = listOf("MATI", "RINGAN", "SEDANG", "MAKS")
        val pvv = intArrayOf(0, 30, 60, 90)
        for (k in pn.indices) {
            val b = rogBtn(pn[k], false) { Opt.smooth(s, pvv[k]); sb.progress = pvv[k]; updateSmooth() }
            b.textSize = 12f
            pr.addView(b, lp(0, -2, 0, 1f).also { it.setMargins(dp(2), 0, dp(2), 0) })
        }
        t.addView(pr, lp(-1, -2, 8))
        t.addView(rogBtn("TERAPKAN SEKARANG", true) { gfxApply(true) }, lp(-1, -2, 10))
        t.addView(label("Animasi dan refresh rate bikin tampilan lebih licin. Hasil bergantung pada game dan HP.", 11f, C.RED), lp(-1, -2, 6))

        t.addView(sec("Auto bersih RAM"), lp(-1, -2, 16))
        t.addView(toggleRow("Auto bersih RAM", s.b("autoClean")) { s.set("autoClean", if (it) 1 else 0) }, lp(-1, -2, 6))
        t.addView(label("Kapan dibersihkan", 11f, C.MUTE), lp(-1, -2, 8))
        t.addView(svcChips(listOf("START", "3m", "5m", "10m", "Pintar"), { s.i("cleanMode") }) { s.set("cleanMode", it) }, lp(-1, -2, 4))
        t.addView(label("Pintar = otomatis saat RAM terpakai lebih dari 85%.", 11f, C.MUTE), lp(-1, -2, 4))
        cleanStatT = label("", 11f, C.CYAN, true)
        t.addView(cleanStatT, lp(-1, -2, 6))
        t.addView(rogBtn("BERSIHKAN RAM SEKARANG", false) { Opt.clean(this) { toast(it); h.post { updateClean() } } }, lp(-1, -2, 8))
        t.addView(rogBtn("PULIHKAN PENGATURAN SISTEM", false) {
            Opt.smooth(s, 0)
            sb.progress = 0
            updateSmooth()
            val app = applicationContext
            Thread { Opt.restore(app) }.start()
            toast("Pengaturan sistem dipulihkan.")
        }, lp(-1, -2, 8))
        updateSmooth()
        updateClean()
        return t
    }

    private fun pageInfo(): LinearLayout {
        val t = page()
        t.addView(sec("Cara pakai menu"))
        t.addView(label("• Ketuk ikon Elaina = buka atau tutup menu.\n• Tahan lalu geser ikon = pindahkan menu.\n• Tombol < = kembali ke halaman utama.\n• CROSSHAIR: bentuk, warna, ukuran.\n• KEYMAP: ketukan otomatis (butuh Shizuku).\n• GRAFIK & RAM: pelicin layar 1 sampai 100% dan auto bersih RAM.\n• ALAT: pantau RAM/CPU/ping, mode fokus, screenshot.", 12f, C.TEXT), lp(-1, -2, 6))
        t.addView(sec("Menu hilang sendiri?"), lp(-1, -2, 14))
        t.addView(label("Buka aplikasi ELAINA > tab LAINNYA > Info, lalu ikuti daftar SIAP MAIN. Yang paling sering: matikan penghemat baterai dan izinkan jendela pop-up di latar belakang (Xiaomi).", 12f, C.MUTE), lp(-1, -2, 4))
        t.addView(rogBtn("HUBUNGI DEVELOPER", false) {
            val i = Intent(this, MainActivity::class.java)
            i.putExtra("sub", 4)
            i.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_CLEAR_TOP)
            startActivity(i)
        }, lp(-1, -2, 12))
        t.addView(rogBtn("BERHENTI (matikan Game Turbo)", false) { stopSelf() }, lp(-1, -2, 8))
        return t
    }

    private fun homeRow(title: String, sub: String, pg: Int): View {
        val r = LinearLayout(this)
        r.gravity = Gravity.CENTER_VERTICAL
        r.setPadding(dp(14), dp(12), dp(14), dp(12))
        r.background = Chamfer(C.PANEL2, C.RED, dp(10).toFloat(), 2f)
        val c = LinearLayout(this)
        c.orientation = LinearLayout.VERTICAL
        c.addView(label(title, 15f, Color.WHITE, true, true))
        c.addView(label(sub, 11f, C.MUTE))
        r.addView(c, LinearLayout.LayoutParams(0, -2, 1f))
        r.addView(label(">", 18f, C.RED, true))
        r.setOnClickListener { showPage(pg) }
        return r
    }

    private fun buildPanel() {
        chips.clear()
        pages.clear()
        val r = LinearLayout(this)
        r.orientation = LinearLayout.VERTICAL
        val b = LinearLayout(this)
        b.orientation = LinearLayout.VERTICAL
        b.setPadding(dp(14), dp(14), dp(14), dp(14))
        b.background = Chamfer(0xFA0E0E14.toInt(), C.RED, dp(14).toFloat(), 3f)

        val hr = LinearLayout(this)
        hr.gravity = Gravity.CENTER_VERTICAL
        val back = rogBtn("<", false) { showPage(0) }
        back.textSize = 13f
        back.visibility = View.GONE
        backBtn = back
        hr.addView(back, LinearLayout.LayoutParams(-2, -2))
        val t1 = label("ELAINA", 20f, Color.WHITE, true, true)
        t1.setShadowLayer(12f, 0f, 0f, C.RED)
        titleT = t1
        hr.addView(t1, lp(0, -2, 0, 1f).also { it.leftMargin = dp(8) })
        val close = rogBtn("TUTUP", false) { if (open) toggle() }
        close.textSize = 12f
        hr.addView(close, LinearLayout.LayoutParams(-2, -2))
        b.addView(hr)

        val home = LinearLayout(this)
        home.orientation = LinearLayout.VERTICAL
        val hstat = label("", 11f, C.CYAN, true)
        homeStat = hstat
        home.addView(hstat, lp(-1, -2, 6))
        home.addView(homeRow("CROSSHAIR", "bentuk, warna, ukuran", 1), lp(-1, -2, 10))
        home.addView(homeRow("KEYMAP", "ketuk otomatis", 2), lp(-1, -2, 8))
        home.addView(homeRow("GRAFIK & RAM", "pelicin layar, auto bersih RAM", 3), lp(-1, -2, 8))
        home.addView(homeRow("ALAT", "RAM, CPU, ping, screenshot", 4), lp(-1, -2, 8))
        home.addView(homeRow("INFO", "cara pakai dan bantuan", 5), lp(-1, -2, 8))
        homeV = home
        b.addView(home, lp(-1, -2, 4))

        pages.add(pageCross())
        pages.add(pageKeymap())
        pages.add(pageGfx())
        pages.add(pageTools())
        pages.add(pageInfo())
        for (pg in pages) { pg.visibility = View.GONE; b.addView(pg, lp(-1, -2, 10)) }

        val sv = ScrollView(this)
        sv.addView(b, LinearLayout.LayoutParams(-1, -2))
        sv.visibility = View.GONE

        val bub = ShapeImageView(this, s)
        bub.setImageResource(R.drawable.elaina)
        bub.alpha = 0.92f
        val slop = ViewConfiguration.get(this).scaledTouchSlop
        var sx = 0f
        var sy = 0f
        var ox = 0
        var oy = 0
        var moved = false
        bub.setOnTouchListener { _, e ->
            val lp = plp
            if (lp == null) false else when (e.action) {
                MotionEvent.ACTION_DOWN -> { sx = e.rawX; sy = e.rawY; ox = lp.x; oy = lp.y; moved = false; true }
                MotionEvent.ACTION_MOVE -> {
                    val dx = e.rawX - sx
                    val dy = e.rawY - sy
                    if (!moved && (Math.abs(dx) > slop || Math.abs(dy) > slop)) moved = true
                    if (moved) { lp.x = ox + dx.toInt(); lp.y = oy + dy.toInt(); clamp() }
                    true
                }
                MotionEvent.ACTION_UP -> {
                    if (!moved) toggle() else {
                        val d = resources.displayMetrics.density
                        s.set("pX", (lp.x / d).toInt()); s.set("pY", (lp.y / d).toInt())
                    }
                    true
                }
                else -> true
            }
        }
        r.addView(bub, LinearLayout.LayoutParams(dp(46), dp(46)))
        r.addView(sv, LinearLayout.LayoutParams(dp(300), dp(10)).also { it.topMargin = dp(6) })
        root = r
        scroll = sv
        body = b
        paintChips()
        paintKm()
        showPage(0)
    }

    private fun showPage(k: Int) {
        s.set("ppage", k)
        homeV?.visibility = if (k == 0) View.VISIBLE else View.GONE
        for (i in pages.indices) pages[i].visibility = if (i + 1 == k) View.VISIBLE else View.GONE
        backBtn?.visibility = if (k == 0) View.GONE else View.VISIBLE
        titleT?.text = if (k == 0) "ELAINA" else pageNames[k.coerceIn(0, 5)]
        if (k == 3) { updateSmooth(); updateClean() }
        if (open) { fitScroll(); if (k == 4) updateStats() }
        h.postDelayed({ clamp() }, 120)
    }

    private fun toggle() {
        open = !open
        scroll?.visibility = if (open) View.VISIBLE else View.GONE
        if (open) { paintKm(); fitScroll(); if (s.i("ppage") == 4) updateStats() }
        h.postDelayed({ clamp() }, 150)
    }

    private fun autoCleanTick() {
        if (!s.b("autoClean")) return
        val mode = s.i("cleanMode").coerceIn(0, 4)
        if (mode == 0) return
        val now = SystemClock.elapsedRealtime()
        val gap = intArrayOf(0, 180, 300, 600, 60)[mode] * 1000L
        if (now - lastAuto < gap) return
        if (mode == 4) {
            val (_, _, p) = Stats.ram(this)
            if (p < 85) return
        }
        lastAuto = now
        Opt.autoClean(this) { h.post { if (open && s.i("ppage") == 3) updateClean() } }
    }

    private fun updateStats() {
        val (u, t, p) = Stats.ram(this)
        ramT?.text = "RAM  $u / $t MB  ($p%)"
        ramBar?.pct = p
        ramBar?.invalidate()
        Stats.pollCpu()
        cpuT?.text = "CPU  " + Stats.cpu()
        val (bp, bt) = Stats.battery(this)
        batT?.text = "BAT  $bp%  •  " + "%.1f".format(bt) + "°C  •  " + Stats.thermal(this)
        tickN++
        if (tickN % 2 == 1) Stats.ping { ms -> pingT?.text = if (ms < 0) "PING  -" else "PING  $ms ms" }
    }

    private fun applyFocus(on: Boolean) {
        try {
            val nm = getSystemService(NotificationManager::class.java)
            if (!nm.isNotificationPolicyAccessGranted) {
                if (on) toast("Mode fokus butuh izin Jangan Ganggu. Aktifkan di tab INFO aplikasi.")
                return
            }
            if (on) {
                if (prevFilter < 0) prevFilter = nm.currentInterruptionFilter
                nm.setInterruptionFilter(NotificationManager.INTERRUPTION_FILTER_ALARMS)
            } else if (prevFilter >= 0) {
                nm.setInterruptionFilter(prevFilter)
                prevFilter = -1
            }
        } catch (e: Exception) { }
    }

    // ================= screenshot =================
    private fun initProjection(code: Int, data: Intent) {
        try {
            val mpm = getSystemService(Context.MEDIA_PROJECTION_SERVICE) as MediaProjectionManager
            val mp = mpm.getMediaProjection(code, data)
            mp.registerCallback(object : MediaProjection.Callback() {
                override fun onStop() { if (!closing) { projection = null; vd = null } }
            }, h)
            val dm = screen()
            val rd = ImageReader.newInstance(dm.widthPixels, dm.heightPixels, PixelFormat.RGBA_8888, 2)
            reader = rd
            vd = mp.createVirtualDisplay("elaina", dm.widthPixels, dm.heightPixels, dm.densityDpi,
                DisplayManager.VIRTUAL_DISPLAY_FLAG_AUTO_MIRROR, rd.surface, null, h)
            projection = mp
        } catch (e: Exception) {
            toast("Screenshot tidak bisa diaktifkan di perangkat ini.")
        }
    }

    private fun hideOv() {
        root?.visibility = View.INVISIBLE
        xh?.visibility = View.INVISIBLE
        km?.vis(false)
    }

    private fun shot() {
        if (shotBusy) return
        if (Shz.ready()) {
            shotBusy = true
            hideOv()
            h.postDelayed({
                Thread {
                    val ok = Opt.shot()
                    h.post { finishShot(if (ok) "Screenshot tersimpan di Galeri (Pictures/ELAINA)." else "Gagal mengambil screenshot.") }
                }.start()
            }, 350)
            return
        }
        if (projection == null || vd == null) {
            toast("Screenshot butuh Shizuku, atau nyalakan Game Turbo dari aplikasi dan izinkan rekam layar.")
            return
        }
        shotBusy = true
        hideOv()
        h.postDelayed({ doShot() }, 400)
    }

    private fun doShot() {
        try {
            val dm = screen()
            val w = dm.widthPixels
            val hh = dm.heightPixels
            reader?.close()
            val r = ImageReader.newInstance(w, hh, PixelFormat.RGBA_8888, 2)
            reader = r
            r.setOnImageAvailableListener({ rd -> save(rd) }, h)
            vd?.resize(w, hh, dm.densityDpi)
            vd?.surface = r.surface
            h.postDelayed({ if (shotBusy) finishShot("Gagal mengambil screenshot. Coba lagi.") }, 3000)
        } catch (e: Exception) {
            finishShot("Gagal mengambil screenshot.")
        }
    }

    private fun save(rd: ImageReader) {
        if (!shotBusy) return
        var img: Image? = null
        try {
            img = rd.acquireLatestImage() ?: return
            val pl = img.planes[0]
            val ps = pl.pixelStride
            val pad = pl.rowStride - ps * img.width
            val bmp = Bitmap.createBitmap(img.width + pad / ps, img.height, Bitmap.Config.ARGB_8888)
            bmp.copyPixelsFromBuffer(pl.buffer)
            val out = Bitmap.createBitmap(bmp, 0, 0, img.width, img.height)
            val cv = ContentValues()
            cv.put(MediaStore.Images.Media.DISPLAY_NAME, "ELAINA_" + System.currentTimeMillis() + ".png")
            cv.put(MediaStore.Images.Media.MIME_TYPE, "image/png")
            cv.put(MediaStore.Images.Media.RELATIVE_PATH, "Pictures/ELAINA")
            val uri = contentResolver.insert(MediaStore.Images.Media.EXTERNAL_CONTENT_URI, cv)
            if (uri == null) { finishShot("Gagal menyimpan screenshot."); return }
            contentResolver.openOutputStream(uri)?.use { out.compress(Bitmap.CompressFormat.PNG, 100, it) }
            finishShot("Screenshot tersimpan di Galeri (Pictures/ELAINA).")
        } catch (e: Exception) {
            finishShot("Gagal menyimpan screenshot.")
        } finally {
            img?.close()
        }
    }

    private fun finishShot(msg: String) {
        shotBusy = false
        reader?.setOnImageAvailableListener(null, null)
        root?.visibility = View.VISIBLE
        xh?.visibility = if (s.b("ovOn")) View.VISIBLE else View.INVISIBLE
        km?.vis(true)
        toast(msg)
    }

    override fun onDestroy() {
        closing = true
        h.removeCallbacksAndMessages(null)
        try { unregisterReceiver(screenOn) } catch (e: Exception) { }
        applyFocus(false)
        try { km?.hide() } catch (e: Exception) { }
        km = null
        Thread { Tap.shutdown() }.start()
        detachAll()
        try { vd?.release() } catch (e: Exception) { }
        try { reader?.close() } catch (e: Exception) { }
        try { projection?.stop() } catch (e: Exception) { }
        vd = null; reader = null; projection = null
        instance = null
        val app = applicationContext
        Thread { Opt.restore(app) }.start()
        super.onDestroy()
    }
}
__XH_EOF__
mkdir -p "app/src/main/java/com/crosshair/pro"
cat > "app/src/main/java/com/crosshair/pro/Painter.kt" <<'__XH_EOF__'
package com.crosshair.pro

import android.content.Context
import android.graphics.*
import android.view.View

object Painter {
    private val path = Path()

    fun draw(c: Canvas, cx: Float, cy: Float, sc: Float, s: Spec, photo: Bitmap?) {
        val rot = s.i("rot").toFloat()
        if (s.b("usePhoto") && photo != null) { drawPhoto(c, cx, cy, sc, s, photo, s.i("pRot").toFloat()); return }
        val mask = s.i("mask")
        if (mask == 0) return
        val th = s.i("th") * sc
        val len = s.i("len") * sc
        val gap = s.i("gap") * sc
        val ring = s.i("ring") * sc
        val ol = maxOf(1f, sc * 0.9f)
        val col = s.i("color")
        val outline = s.b("outline")
        val start = if ((mask and 4) != 0) ring + gap else gap
        val p = Paint(Paint.ANTI_ALIAS_FLAG)
        val layer = c.saveLayerAlpha(null, s.i("op") * 255 / 100)
        c.translate(cx, cy)
        c.rotate(rot)
        for (pass in 0..1) {
            if (pass == 0 && !outline) continue
            val ex = if (pass == 0) ol else 0f
            p.color = if (pass == 0) Color.BLACK else col
            if ((mask and 1) != 0) arms(c, p, floatArrayOf(0f, 90f, 180f, 270f), start, len, th, ex)
            if ((mask and 2) != 0) arms(c, p, floatArrayOf(45f, 135f, 225f, 315f), start, len, th, ex)
            if ((mask and 4) != 0) {
                p.style = Paint.Style.STROKE; p.strokeWidth = th + ex * 2
                c.drawCircle(0f, 0f, ring, p)
            }
            if ((mask and 16) != 0) {
                val half = maxOf(ring, 8f * sc)
                val bl = maxOf(len * 0.6f, th * 2)
                p.style = Paint.Style.STROKE; p.strokeWidth = th + ex * 2
                p.strokeJoin = Paint.Join.MITER
                for (sx in intArrayOf(-1, 1)) for (sy in intArrayOf(-1, 1)) {
                    path.reset()
                    path.moveTo(sx * (half - bl), sy * half)
                    path.lineTo(sx * half, sy * half)
                    path.lineTo(sx * half, sy * (half - bl))
                    c.drawPath(path, p)
                }
            }
            if ((mask and 32) != 0) {
                val r = maxOf(ring, 8f * sc) * 0.9f
                p.style = Paint.Style.STROKE; p.strokeWidth = th + ex * 2
                p.strokeJoin = Paint.Join.MITER
                path.reset()
                path.moveTo(0f, -r); path.lineTo(r * 0.87f, r * 0.5f); path.lineTo(-r * 0.87f, r * 0.5f); path.close()
                c.drawPath(path, p)
            }
            if ((mask and 8) != 0) {
                p.style = Paint.Style.FILL
                c.drawCircle(0f, 0f, maxOf(s.i("dotSize"), 1) * sc / 2 + ex, p)
            }
        }
        c.restoreToCount(layer)
    }

    private fun arms(c: Canvas, p: Paint, angles: FloatArray, start: Float, len: Float, th: Float, ex: Float) {
        p.style = Paint.Style.FILL
        for (a in angles) {
            c.save()
            c.rotate(a)
            c.drawRect(start - ex, -th / 2 - ex, start + len + ex, th / 2 + ex, p)
            c.restore()
        }
    }

    private fun drawPhoto(c: Canvas, cx0: Float, cy0: Float, sc: Float, s: Spec, photo: Bitmap, rot: Float) {
        val cx = cx0 + s.i("pDx") * sc
        val cy = cy0 + s.i("pDy") * sc
        val size = s.i("pSize") * sc
        val pp = Paint(Paint.FILTER_BITMAP_FLAG or Paint.ANTI_ALIAS_FLAG)
        pp.alpha = s.i("pOp") * 255 / 100
        if (s.b("tint")) pp.colorFilter = PorterDuffColorFilter(s.i("color"), PorterDuff.Mode.SRC_IN)
        c.save()
        c.rotate(rot, cx, cy)
        if (s.i("pShape") == 1) {
            val side = minOf(photo.width, photo.height)
            val src = Rect((photo.width - side) / 2, (photo.height - side) / 2, (photo.width + side) / 2, (photo.height + side) / 2)
            val dst = RectF(cx - size / 2, cy - size / 2, cx + size / 2, cy + size / 2)
            path.reset()
            path.addOval(dst, Path.Direction.CW)
            c.save()
            c.clipPath(path)
            c.drawBitmap(photo, src, dst, pp)
            c.restore()
            if (s.b("pRing")) {
                val rp = Paint(Paint.ANTI_ALIAS_FLAG)
                val w = maxOf(2f, sc * 2.5f)
                rp.style = Paint.Style.STROKE; rp.strokeWidth = w; rp.color = s.i("color"); rp.alpha = pp.alpha
                c.drawCircle(cx, cy, size / 2 - w / 2, rp)
            }
        } else {
            val m = maxOf(photo.width, photo.height).toFloat()
            val k = size / m
            val w = photo.width * k
            val h = photo.height * k
            c.drawBitmap(photo, null, RectF(cx - w / 2, cy - h / 2, cx + w / 2, cy + h / 2), pp)
        }
        c.restore()
    }
}

class CrosshairView(ctx: Context, private val spec: Spec) : View(ctx) {
    var photo: Bitmap? = null
    override fun onDraw(canvas: Canvas) {
        Painter.draw(canvas, width / 2f, height / 2f, resources.displayMetrics.density, spec, photo)
    }
}

class PickView(ctx: Context) : View(ctx) {
    var bmp: Bitmap? = null
    var onPick: ((Int, Int) -> Unit)? = null
    private val dst = RectF()
    private val p = Paint()
    override fun onDraw(c: Canvas) {
        val sq = 24
        var y = 0
        while (y < height) {
            var x = 0
            while (x < width) {
                p.color = if (((x / sq) + (y / sq)) % 2 == 0) 0xFF8A949C.toInt() else 0xFFC9D0D5.toInt()
                c.drawRect(x.toFloat(), y.toFloat(), (x + sq).toFloat(), (y + sq).toFloat(), p)
                x += sq
            }
            y += sq
        }
        val b = bmp ?: return
        val sc = minOf(width / b.width.toFloat(), height / b.height.toFloat())
        val w = b.width * sc
        val h = b.height * sc
        dst.set((width - w) / 2, (height - h) / 2, (width + w) / 2, (height + h) / 2)
        c.drawBitmap(b, null, dst, null)
    }
    override fun onTouchEvent(e: android.view.MotionEvent): Boolean {
        val b = bmp ?: return false
        if (e.action == android.view.MotionEvent.ACTION_DOWN) return true
        if (e.action == android.view.MotionEvent.ACTION_UP && dst.contains(e.x, e.y)) {
            val x = ((e.x - dst.left) / dst.width() * b.width).toInt().coerceIn(0, b.width - 1)
            val y = ((e.y - dst.top) / dst.height() * b.height).toInt().coerceIn(0, b.height - 1)
            onPick?.invoke(x, y)
            performClick()
        }
        return true
    }
    override fun performClick(): Boolean = super.performClick()
}
__XH_EOF__
mkdir -p "app/src/main/java/com/crosshair/pro"
cat > "app/src/main/java/com/crosshair/pro/Shz.kt" <<'__XH_EOF__'
package com.crosshair.pro

import android.content.Context
import android.content.pm.PackageManager
import android.os.Handler
import android.os.Looper
import android.provider.Settings
import rikka.shizuku.Shizuku

object Shz {
    fun alive(): Boolean = try { Shizuku.pingBinder() } catch (e: Throwable) { false }
    fun granted(): Boolean = try { Shizuku.checkSelfPermission() == PackageManager.PERMISSION_GRANTED } catch (e: Throwable) { false }
    fun ready(): Boolean = alive() && granted()
    fun request() { try { if (alive()) Shizuku.requestPermission(100) } catch (e: Throwable) { } }

    /** Proses shell berumur panjang lewat Shizuku. */
    fun proc(cmd: Array<String>): Process {
        val m = Shizuku::class.java.getDeclaredMethod("newProcess", Array<String>::class.java, Array<String>::class.java, String::class.java)
        m.isAccessible = true
        return m.invoke(null, cmd, null, null) as Process
    }

    /** Blocking. Jalankan hanya dari thread latar. */
    fun exec(cmd: String): String {
        return try {
            val p = proc(arrayOf("sh", "-c", "($cmd) 2>&1"))
            val out = p.inputStream.bufferedReader().readText()
            p.waitFor()
            out.trim()
        } catch (e: Throwable) { "" }
    }
}

object Opt {
    val RES = intArrayOf(100, 90, 80, 70, 60)
    private val KEYS = listOf(
        "global:window_animation_scale", "global:transition_animation_scale", "global:animator_duration_scale",
        "system:min_refresh_rate", "system:peak_refresh_rate", "global:low_power"
    )
    private fun prefs(c: Context) = c.getSharedPreferences("xh_opt", Context.MODE_PRIVATE)
    private fun ui(f: () -> Unit) { Handler(Looper.getMainLooper()).post { f() } }

    @Volatile var lastCleanAt = 0L
    @Volatile var lastFreed = 0L

    /** Level kelicinan 1-100 jadi pengaturan nyata (resolusi, animasi, refresh rate, mode performa). 0 = mati. */
    fun smooth(s: Spec, lv: Int) {
        if (lv <= 0) { preset(s, 0); s.set("smooth", 0); return }
        s.set("autoClean", if (lv >= 15) 1 else 0)
        s.set("gmode", 1)
        s.set("anim", if (lv >= 60) 2 else if (lv >= 30) 1 else 0)
        s.set("hz", if (lv >= 90) 3 else if (lv >= 65) 2 else if (lv >= 40) 1 else 0)
        s.set("res", 0)
        s.set("fperf", if (lv >= 60) 1 else 0)
        s.set("perf", if (lv >= 60) 3 else if (lv >= 30) 2 else 1)
        s.set("smooth", lv)
    }

    fun smoothDesc(lv: Int): String {
        if (lv <= 0) return "Mati. Tidak ada perubahan pada game."
        val an = if (lv >= 60) "mati" else if (lv >= 30) "cepat" else "normal"
        val hz = if (lv >= 90) "144 Hz" else if (lv >= 65) "120 Hz" else if (lv >= 40) "90 Hz" else "bawaan"
        return "Animasi " + an + ", refresh rate " + hz + (if (lv >= 60) ", mode performa tetap" else "") + ", bersih RAM " + (if (lv >= 15) "aktif" else "mati") + "."
    }

    /** Bersihkan proses latar tanpa Shizuku (aplikasi yang sedang di latar belakang saja). */
    fun cleanLite(c: Context, keep: String?): Int {
        var n = 0
        try {
            val am = c.getSystemService(Context.ACTIVITY_SERVICE) as android.app.ActivityManager
            val pm = c.packageManager
            val li = android.content.Intent(android.content.Intent.ACTION_MAIN).addCategory(android.content.Intent.CATEGORY_LAUNCHER)
            val hi = android.content.Intent(android.content.Intent.ACTION_MAIN).addCategory(android.content.Intent.CATEGORY_HOME)
            val homePkg = pm.resolveActivity(hi, 0)?.activityInfo?.packageName
            for (ri in pm.queryIntentActivities(li, 0)) {
                val pk = ri.activityInfo.packageName
                if (pk == c.packageName || pk == keep || pk == homePkg) continue
                am.killBackgroundProcesses(pk)
                n++
            }
        } catch (e: Exception) { }
        return n
    }

    /** Auto bersih RAM: dipanggil dari layanan. Memakai Shizuku bila ada, kalau tidak cara ringan. */
    fun autoClean(c: Context, cb: ((String) -> Unit)?) {
        val app = c.applicationContext
        Thread {
            val keep = prefs(app).getString("lastPkg", null)
            val before = Stats.ram(app).first
            if (Shz.ready()) Shz.exec("am kill-all")
            cleanLite(app, keep)
            try { Thread.sleep(1200) } catch (e: Exception) { }
            val after = Stats.ram(app).first
            lastFreed = maxOf(0L, before - after)
            lastCleanAt = System.currentTimeMillis()
            if (cb != null) ui { cb("RAM dibebaskan sekitar " + lastFreed + " MB") }
        }.start()
    }

    fun secureOk(c: Context): Boolean = c.checkSelfPermission("android.permission.WRITE_SECURE_SETTINGS") == PackageManager.PERMISSION_GRANTED

    fun keepAlive(c: Context) {
        val pk = c.packageName
        Shz.exec("cmd deviceidle whitelist +$pk; cmd appops set $pk RUN_ANY_IN_BACKGROUND allow; cmd appops set $pk RUN_IN_BACKGROUND allow; am set-standby-bucket $pk active")
    }

    /** Profil cepat: 0 Normal, 1 Seimbang, 2 Performa, 3 Maksimal. */
    fun preset(s: Spec, n: Int) {
        when (n) {
            0 -> { s.set("autoClean", 0); s.set("gmode", 0); s.set("anim", 0); s.set("hz", 0); s.set("res", 0); s.set("fperf", 0) }
            1 -> { s.set("autoClean", 1); s.set("gmode", 1); s.set("anim", 1); s.set("hz", 0); s.set("res", 0); s.set("fperf", 0) }
            2 -> { s.set("autoClean", 1); s.set("gmode", 1); s.set("anim", 1); s.set("hz", 2); s.set("res", 0); s.set("fperf", 0) }
            else -> { s.set("autoClean", 1); s.set("gmode", 1); s.set("anim", 2); s.set("hz", 2); s.set("res", 0); s.set("fperf", 1) }
        }
        s.set("perf", n)
    }

    /** Terapkan pengaturan performa dan grafik. Jalankan dari thread latar. */
    fun apply(c: Context, s: Spec, pkg: String?) {
        if (pkg != null) prefs(c).edit().putString("lastPkg", pkg).apply()
        if (!Shz.ready()) {
            applyLite(c, s)
            if (s.b("autoClean")) cleanLite(c, pkg)
            return
        }
        val p = prefs(c)
        keepAlive(c)
        if (!p.getBoolean("active", false)) {
            val ed = p.edit()
            for (k in KEYS) {
                val parts = k.split(":")
                ed.putString(k, Shz.exec("settings get " + parts[0] + " " + parts[1]))
            }
            ed.putBoolean("active", true).apply()
        }
        if (s.b("autoClean")) Shz.exec("am kill-all")
        val an = s.i("anim")
        if (an > 0) {
            val v = if (an == 1) "0.5" else "0"
            for (key in listOf("window_animation_scale", "transition_animation_scale", "animator_duration_scale"))
                Shz.exec("settings put global $key $v")
        }
        val hz = s.i("hz")
        if (hz > 0) {
            val v = intArrayOf(0, 90, 120, 144)[hz.coerceIn(0, 3)]
            Shz.exec("settings put system min_refresh_rate $v")
            Shz.exec("settings put system peak_refresh_rate $v")
        }
        if (s.i("perf") >= 1) Shz.exec("settings put global low_power 0")
        val gp = pkg ?: p.getString("lastPkg", null)
        if (s.b("gmode") && gp != null) {
            Shz.exec("cmd game mode performance $gp")
            p.edit().putString("gpkg", gp).apply()
        }
        if (s.b("fperf")) {
            Shz.exec("cmd power set-fixed-performance-mode-enabled true")
            p.edit().putBoolean("fperfOn", true).apply()
        }
    }

    /** Tanpa Shizuku tetapi izin WRITE_SECURE_SETTINGS sudah diberikan lewat ADB: hanya animasi. */
    private fun applyLite(c: Context, s: Spec) {
        if (!secureOk(c)) return
        val an = s.i("anim")
        if (an == 0) return
        try {
            val p = prefs(c)
            val cr = c.contentResolver
            if (!p.getBoolean("lite", false)) {
                val ed = p.edit()
                for (key in listOf("window_animation_scale", "transition_animation_scale", "animator_duration_scale"))
                    ed.putString("lite_$key", Settings.Global.getString(cr, key))
                ed.putBoolean("lite", true).apply()
            }
            val v = if (an == 1) "0.5" else "0"
            for (key in listOf("window_animation_scale", "transition_animation_scale", "animator_duration_scale"))
                Settings.Global.putString(cr, key, v)
        } catch (e: Exception) { }
    }

    /** Kembalikan semua pengaturan sistem seperti semula. */
    fun restore(c: Context) {
        val p = prefs(c)
        if (p.getBoolean("lite", false) && secureOk(c)) {
            try {
                for (key in listOf("window_animation_scale", "transition_animation_scale", "animator_duration_scale")) {
                    val v = p.getString("lite_$key", null)
                    Settings.Global.putString(c.contentResolver, key, v ?: "1")
                }
            } catch (e: Exception) { }
            p.edit().putBoolean("lite", false).apply()
        }
        if (!p.getBoolean("active", false) && !p.getBoolean("resOn", false)) return
        if (!Shz.ready()) return
        for (k in KEYS) {
            val parts = k.split(":")
            val v = p.getString(k, "null") ?: "null"
            if (v == "null" || v.isEmpty()) Shz.exec("settings delete " + parts[0] + " " + parts[1])
            else Shz.exec("settings put " + parts[0] + " " + parts[1] + " " + v)
        }
        val g = p.getString("gpkg", null)
        if (g != null) Shz.exec("cmd game mode standard $g")
        if (p.getBoolean("fperfOn", false)) Shz.exec("cmd power set-fixed-performance-mode-enabled false")
        if (p.getBoolean("resOn", false)) Shz.exec("wm size reset; wm density reset")
        val last = p.getString("lastPkg", null)
        p.edit().clear().apply()
        if (last != null) p.edit().putString("lastPkg", last).apply()
    }

    fun clean(c: Context, cb: (String) -> Unit) { autoClean(c, cb) }

    fun grantAll(c: Context, cb: (String) -> Unit) {
        val pk = c.packageName
        Thread {
            Shz.exec("appops set $pk SYSTEM_ALERT_WINDOW allow")
            Shz.exec("appops set $pk 10021 allow")
            Shz.exec("cmd notification allow_dnd $pk")
            Shz.exec("pm grant $pk android.permission.POST_NOTIFICATIONS")
            Shz.exec("pm grant $pk android.permission.WRITE_SECURE_SETTINGS")
            keepAlive(c)
            ui { cb("Izin diberikan lewat Shizuku (termasuk jendela pop-up di latar untuk Xiaomi). Cek di tab INFO.") }
        }.start()
    }

    /** Screenshot tanpa popup rekam layar. Blocking; true jika file tersimpan. */
    fun shot(): Boolean {
        val dir = "/sdcard/Pictures/ELAINA"
        val path = dir + "/ELAINA_" + System.currentTimeMillis() + ".png"
        Shz.exec("mkdir -p $dir; screencap -p $path")
        val ok = Shz.exec("[ -s $path ] && echo ok") == "ok"
        if (ok) Shz.exec("am broadcast -a android.intent.action.MEDIA_SCANNER_SCAN_FILE -d file://$path")
        return ok
    }
}
__XH_EOF__
mkdir -p "app/src/main/java/com/crosshair/pro"
cat > "app/src/main/java/com/crosshair/pro/SoundFx.kt" <<'__XH_EOF__'
package com.crosshair.pro

import android.content.Context
import android.media.AudioAttributes
import android.media.AudioFormat
import android.media.AudioTrack
import android.os.Handler
import android.os.Looper

/** Efek suara (SE) sintetis, tanpa file audio. */
object SoundFx {
    private const val SR = 22050

    private fun on(c: Context) = c.getSharedPreferences("xh", Context.MODE_PRIVATE).getInt("sfx", 1) == 1

    private fun tone(ms: Int, f0: Double, f1: Double, decay: Double, noise: Double, shape: Boolean): ShortArray {
        val n = SR * ms / 1000
        val out = ShortArray(n)
        var ph = 0.0
        val rnd = java.util.Random(7)
        for (i in 0 until n) {
            val k = i.toDouble() / n
            ph += 2 * Math.PI * (f0 + (f1 - f0) * k) / SR
            val env = if (shape) Math.sin(Math.PI * k) else Math.exp(-decay * k)
            val v = (Math.sin(ph) * (1 - noise) + (rnd.nextDouble() - 0.5) * 2 * noise) * env * 0.6
            out[i] = (v * 32767).toInt().coerceIn(-32767, 32767).toShort()
        }
        return out
    }

    private val clickPcm: ShortArray by lazy { tone(50, 1300.0, 800.0, 7.0, 0.0, false) }
    private val whooshPcm: ShortArray by lazy { tone(1000, 160.0, 1900.0, 0.0, 0.55, true) }
    private val readyPcm: ShortArray by lazy { tone(160, 660.0, 660.0, 3.0, 0.0, false) + tone(260, 990.0, 1320.0, 3.5, 0.0, false) }

    private val thudPcm: ShortArray by lazy { tone(420, 130.0, 38.0, 5.0, 0.3, false) }
    private val riserPcm: ShortArray by lazy { tone(1500, 90.0, 1500.0, 0.0, 0.25, true) }

    private fun play(c: Context, pcm: ShortArray, vol: Float) {
        if (!on(c)) return
        try {
            val t = AudioTrack.Builder()
                .setAudioAttributes(AudioAttributes.Builder().setUsage(AudioAttributes.USAGE_GAME).setContentType(AudioAttributes.CONTENT_TYPE_SONIFICATION).build())
                .setAudioFormat(AudioFormat.Builder().setEncoding(AudioFormat.ENCODING_PCM_16BIT).setSampleRate(SR).setChannelMask(AudioFormat.CHANNEL_OUT_MONO).build())
                .setBufferSizeInBytes(pcm.size * 2)
                .setTransferMode(AudioTrack.MODE_STATIC)
                .build()
            t.write(pcm, 0, pcm.size)
            t.setVolume(vol)
            t.play()
            Handler(Looper.getMainLooper()).postDelayed({ try { t.release() } catch (e: Exception) { } }, pcm.size * 1000L / SR + 250)
        } catch (e: Exception) { }
    }

    fun click(c: Context) = play(c, clickPcm, 0.45f)
    fun whoosh(c: Context) = play(c, whooshPcm, 0.7f)
    fun ready(c: Context) = play(c, readyPcm, 0.7f)
    fun thud(c: Context) = play(c, thudPcm, 1.0f)
    fun riser(c: Context) = play(c, riserPcm, 0.8f)
}
__XH_EOF__
mkdir -p "app/src/main/java/com/crosshair/pro"
cat > "app/src/main/java/com/crosshair/pro/Spec.kt" <<'__XH_EOF__'
package com.crosshair.pro

import android.content.Context
import android.content.SharedPreferences
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import java.io.File

class Spec(ctx: Context) {
    private val p: SharedPreferences = ctx.getSharedPreferences("xh", Context.MODE_PRIVATE)

    companion object {
        val D = mapOf(
            "color" to 0xFF39FF88.toInt(), "len" to 14, "th" to 3, "gap" to 5,
            "rot" to 0, "op" to 100, "outline" to 1, "dotSize" to 4, "ring" to 22, "mask" to 1,
            "usePhoto" to 0, "pSize" to 70, "pOp" to 100, "tint" to 0, "pShape" to 0, "pRing" to 0,
            "pRot" to 0, "pDx" to 0, "pDy" to 0,
            "tol" to 40, "feather" to 1, "mode" to 0, "offX" to 0, "offY" to 0, "hasBg" to 0, "bgColor" to 0,
            "imgShape" to 0, "ovOn" to 1, "focus" to 1, "shot" to 1,
            "pX" to 0, "pY" to 200, "ppage" to 0,
            "kmOn" to 1, "sfx" to 1, "kmEng" to 0,
            "perf" to 0, "smooth" to 0, "cleanMode" to 4, "autoClean" to 1, "anim" to 0, "hz" to 0, "gmode" to 1, "res" to 0, "fperf" to 0
        )
    }

    fun i(k: String): Int = p.getInt(k, D[k] ?: 0)
    fun b(k: String): Boolean = i(k) == 1
    fun set(k: String, v: Int) { p.edit().putInt(k, v).apply() }
    fun pins(): MutableSet<String> = p.getStringSet("pins", emptySet())!!.toMutableSet()
    fun setPins(v: Set<String>) { p.edit().putStringSet("pins", HashSet(v)).apply() }
    fun reset() { p.edit().clear().apply() }
}

object Store {
    private var cache: Bitmap? = null
    private var stamp = -1L
    fun cut(c: Context): Bitmap? {
        val f = File(c.filesDir, "cut.png")
        if (!f.exists()) { cache = null; stamp = -1L; return null }
        val m = f.lastModified() + f.length()
        if (m != stamp || cache == null) { cache = BitmapFactory.decodeFile(f.path); stamp = m }
        return cache
    }
}
__XH_EOF__
mkdir -p "app/src/main/java/com/crosshair/pro"
cat > "app/src/main/java/com/crosshair/pro/Stats.kt" <<'__XH_EOF__'
package com.crosshair.pro

import android.app.ActivityManager
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.os.BatteryManager
import android.os.Environment
import android.os.Handler
import android.os.Looper
import android.os.PowerManager
import android.os.StatFs
import java.io.File
import java.net.InetSocketAddress
import java.net.Socket

object Stats {
    @Volatile var cpuLoad = -1
    @Volatile private var polling = false
    private var lastTotal = 0L
    private var lastIdle = 0L

    /** Hanya aktif jika Shizuku terhubung. */
    fun pollCpu() {
        if (polling || !Shz.ready()) return
        polling = true
        Thread {
            try {
                val f = Shz.exec("head -n1 /proc/stat").trim().split(Regex("\\s+"))
                if (f.size > 8 && f[0] == "cpu") {
                    val v = f.drop(1).take(8).map { it.toLongOrNull() ?: 0L }
                    val tot = v.sum()
                    val idle = v[3] + v[4]
                    if (lastTotal > 0 && tot > lastTotal) {
                        cpuLoad = (100L * ((tot - lastTotal) - (idle - lastIdle)) / (tot - lastTotal)).toInt().coerceIn(0, 100)
                    }
                    lastTotal = tot
                    lastIdle = idle
                }
            } catch (e: Exception) { }
            polling = false
        }.start()
    }

    fun ram(c: Context): Triple<Long, Long, Int> {
        val am = c.getSystemService(Context.ACTIVITY_SERVICE) as ActivityManager
        val mi = ActivityManager.MemoryInfo()
        am.getMemoryInfo(mi)
        val t = mi.totalMem / 1048576
        val u = (mi.totalMem - mi.availMem) / 1048576
        return Triple(u, t, if (t > 0) (u * 100 / t).toInt() else 0)
    }

    fun battery(c: Context): Pair<Int, Float> {
        val i = c.registerReceiver(null, IntentFilter(Intent.ACTION_BATTERY_CHANGED))
        val l = i?.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) ?: -1
        val sc = i?.getIntExtra(BatteryManager.EXTRA_SCALE, 100) ?: 100
        val t = (i?.getIntExtra(BatteryManager.EXTRA_TEMPERATURE, 0) ?: 0) / 10f
        return Pair(if (l >= 0 && sc > 0) l * 100 / sc else 0, t)
    }

    fun storage(): Triple<Long, Long, Int> {
        return try {
            val st = StatFs(Environment.getDataDirectory().path)
            val total = st.blockCountLong * st.blockSizeLong
            val free = st.availableBlocksLong * st.blockSizeLong
            val used = total - free
            Triple(used / 1073741824, total / 1073741824, if (total > 0) (used * 100 / total).toInt() else 0)
        } catch (e: Exception) { Triple(0L, 0L, 0) }
    }

    fun cpu(): String {
        val n = Runtime.getRuntime().availableProcessors()
        var mx = 0L
        for (k in 0 until n) {
            try {
                val v = File("/sys/devices/system/cpu/cpu$k/cpufreq/scaling_cur_freq").readText().trim().toLong()
                if (v > mx) mx = v
            } catch (e: Exception) { }
        }
        val base = if (mx > 0) "$n core  •  " + "%.2f".format(mx / 1000000.0) + " GHz" else "$n core"
        return if (cpuLoad >= 0) "$base  •  $cpuLoad%" else base
    }

    fun thermal(c: Context): String {
        return try {
            val pm = c.getSystemService(Context.POWER_SERVICE) as PowerManager
            when (pm.currentThermalStatus) {
                0 -> "Normal"
                1 -> "Hangat"
                2 -> "Panas ringan"
                3 -> "Panas"
                4 -> "Sangat panas"
                else -> "Kritis"
            }
        } catch (e: Exception) { "-" }
    }

    fun ping(cb: (Int) -> Unit) {
        Thread {
            var ms = -1
            try {
                val t = System.nanoTime()
                val so = Socket()
                so.connect(InetSocketAddress("8.8.8.8", 53), 1500)
                so.close()
                ms = ((System.nanoTime() - t) / 1000000).toInt()
            } catch (e: Exception) { }
            val r = ms
            Handler(Looper.getMainLooper()).post { cb(r) }
        }.start()
    }
}
__XH_EOF__
mkdir -p "app/src/main/java/com/crosshair/pro"
cat > "app/src/main/java/com/crosshair/pro/Ui.kt" <<'__XH_EOF__'
package com.crosshair.pro

import android.content.Context
import android.graphics.*
import android.graphics.drawable.Drawable
import android.view.Gravity
import android.view.View
import android.widget.ImageView
import android.widget.LinearLayout
import android.widget.TextView

object C {
    val BG = 0xFF050507.toInt()
    val PANEL = 0xFF0F0B18.toInt()
    val PANEL2 = 0xFF1A1228.toInt()
    val LINE = 0xFF34244F.toInt()
    val RED = 0xFF8B3DFF.toInt()
    val HOT = 0xFFFF2D55.toInt()
    val CYAN = 0xFFC9A6FF.toInt()
    val TEXT = 0xFFF4F0FA.toInt()
    val MUTE = 0xFF9A8CB8.toInt()
    val GREEN = 0xFF39FF88.toInt()
}

fun Context.dp(v: Int): Int = (v * resources.displayMetrics.density).toInt()

class Chamfer(private val fill: Int, private val stroke: Int, private val cut: Float, private val sw: Float = 2f) : Drawable() {
    private val p = Paint(Paint.ANTI_ALIAS_FLAG)
    private val path = Path()
    override fun draw(c: Canvas) {
        val h = sw / 2
        val l = bounds.left + h
        val t = bounds.top + h
        val r = bounds.right - h
        val b = bounds.bottom - h
        path.reset()
        path.moveTo(l + cut, t); path.lineTo(r, t); path.lineTo(r, b - cut)
        path.lineTo(r - cut, b); path.lineTo(l, b); path.lineTo(l, t + cut); path.close()
        p.style = Paint.Style.FILL; p.color = fill; c.drawPath(path, p)
        if (sw > 0f && stroke != 0) { p.style = Paint.Style.STROKE; p.strokeWidth = sw; p.color = stroke; c.drawPath(path, p) }
    }
    override fun setAlpha(a: Int) {}
    override fun setColorFilter(cf: ColorFilter?) {}
    override fun getOpacity(): Int = PixelFormat.TRANSLUCENT
}

fun Context.label(t: String, sp: Float = 14f, color: Int = C.TEXT, bold: Boolean = false, italic: Boolean = false): TextView {
    val v = TextView(this)
    v.text = t
    v.textSize = sp
    v.setTextColor(color)
    val st = if (bold && italic) Typeface.BOLD_ITALIC else if (bold) Typeface.BOLD else if (italic) Typeface.ITALIC else Typeface.NORMAL
    v.typeface = Typeface.create("sans-serif-condensed", st)
    return v
}

fun Context.rogBtn(t: String, primary: Boolean, onClick: () -> Unit): TextView {
    val v = label(t, 15f, if (primary) Color.WHITE else C.TEXT, true)
    v.gravity = Gravity.CENTER
    v.setPadding(dp(16), dp(12), dp(16), dp(12))
    v.background = if (primary) Chamfer(C.RED, C.HOT, dp(10).toFloat()) else Chamfer(C.PANEL2, C.LINE, dp(10).toFloat())
    v.setOnClickListener { SoundFx.click(this); onClick() }
    return v
}

fun Context.card(pad: Int = 14): LinearLayout {
    val l = LinearLayout(this)
    l.orientation = LinearLayout.VERTICAL
    l.setPadding(dp(pad), dp(pad), dp(pad), dp(pad))
    l.background = Chamfer(C.PANEL, C.LINE, dp(12).toFloat())
    return l
}

fun Context.lp(w: Int = -1, h: Int = -2, top: Int = 0, weight: Float = 0f): LinearLayout.LayoutParams {
    val p = LinearLayout.LayoutParams(w, h, weight)
    p.topMargin = dp(top)
    return p
}

fun Context.section(t: String): TextView {
    val v = label(t, 15f, Color.WHITE, true, true)
    v.setPadding(dp(14), dp(4), dp(20), dp(4))
    v.background = Chamfer(C.RED, 0, dp(8).toFloat(), 0f)
    return v
}

class Bar(ctx: Context) : View(ctx) {
    var pct = 0
    var col = C.RED
    private val p = Paint()
    override fun onDraw(c: Canvas) {
        p.color = C.PANEL2
        c.drawRect(0f, 0f, width.toFloat(), height.toFloat(), p)
        p.color = col
        c.drawRect(0f, 0f, width * pct.coerceIn(0, 100) / 100f, height.toFloat(), p)
    }
}

class ShapeImageView(ctx: Context, private val sp: Spec) : ImageView(ctx) {
    private val path = Path()
    init { scaleType = ScaleType.CENTER_CROP }
    override fun onDraw(c: Canvas) {
        val w = width.toFloat()
        val h = height.toFloat()
        path.reset()
        if (sp.i("imgShape") == 0) path.addOval(0f, 0f, w, h, Path.Direction.CW) else path.addRect(0f, 0f, w, h, Path.Direction.CW)
        c.save()
        c.clipPath(path)
        super.onDraw(c)
        c.restore()
    }
}

class MaxScroll(ctx: Context, private val maxH: () -> Int) : android.widget.ScrollView(ctx) {
    override fun onMeasure(w: Int, h: Int) {
        super.onMeasure(w, View.MeasureSpec.makeMeasureSpec(maxH(), View.MeasureSpec.AT_MOST))
    }
}

fun Context.toggleRow(text: String, initial: Boolean, onChange: (Boolean) -> Unit): LinearLayout {
    val r = LinearLayout(this)
    r.gravity = Gravity.CENTER_VERTICAL
    r.setPadding(dp(12), dp(10), dp(12), dp(10))
    r.background = Chamfer(C.PANEL2, C.LINE, dp(8).toFloat())
    val t = label(text, 14f, C.TEXT, true)
    val pill = label("", 13f, Color.WHITE, true)
    pill.gravity = Gravity.CENTER
    pill.setPadding(dp(14), dp(6), dp(14), dp(6))
    var on = initial
    fun paint() {
        pill.text = if (on) "ON" else "OFF"
        pill.background = Chamfer(if (on) C.RED else C.PANEL, C.LINE, dp(6).toFloat(), 0f)
        pill.setTextColor(if (on) Color.WHITE else C.MUTE)
    }
    paint()
    r.setOnClickListener { on = !on; paint(); onChange(on) }
    r.addView(t, LinearLayout.LayoutParams(0, -2, 1f))
    r.addView(pill)
    return r
}
__XH_EOF__
mkdir -p "app/src/main/res/drawable-nodpi"
base64 -d > "app/src/main/res/drawable-nodpi/elaina.jpg" <<'__XH_B64__'
/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAQDAwMDAgQDAwMEBAQFBgoGBgUFBgwICQcKDgwPDg4M
DQ0PERYTDxAVEQ0NExoTFRcYGRkZDxIbHRsYHRYYGRj/2wBDAQQEBAYFBgsGBgsYEA0QGBgYGBgY
GBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBj/wAARCAIAAgADASIA
AhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQA
AAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3
ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWm
p6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEA
AwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSEx
BhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElK
U1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3
uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwD6qtoY
rezS3jT5I1CAY9BTmwWOU/KnYG8YwG5pjkgZOD7GvRbJjG2gw7VUKuMj9adxgFcD2xQZAFIAOeen
pTMjf16H9KQNXJo9rHoBznOKtFEPUfkKz0JDgnI9s/59KvJMGXDEdMcfWh6AgaJcZyMfTpTDIiIQ
B0GenellY7AoNQsh5bB+maa10E1YcsiEAgAjPAPpRlW54PFNIxkdqMk/XPU9qYWuMK9OBnpkjtVh
AuQcDHXpUZQ7gefr0qQAkEDB9DmheYKNtSRMBRwBgelZPiXV7TR/DV3qVwyhIYyeQPStIuAuTn61
4J+0P4uaz0iLw9bS4knOZQD/AAjt2rpwlF1aqicONrqlScurPN7TVm1jxDeaiw2meVnCjoBVnUGP
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
__XH_B64__
mkdir -p "app/src/main/res/drawable-nodpi"
base64 -d > "app/src/main/res/drawable-nodpi/rabbit_head.png" <<'__XH_B64__'
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
__XH_B64__
mkdir -p "app/src/main/res/drawable-nodpi"
base64 -d > "app/src/main/res/drawable-nodpi/rabbit_leap.png" <<'__XH_B64__'
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
SUVORK5CYII=
__XH_B64__
mkdir -p "app/src/main/res/drawable"
cat > "app/src/main/res/drawable/ic_fg.xml" <<'__XH_EOF__'
<?xml version="1.0" encoding="utf-8"?>
<inset xmlns:android="http://schemas.android.com/apk/res/android"
    android:drawable="@drawable/elaina"
    android:inset="17%" />
__XH_EOF__
mkdir -p "app/src/main/res/drawable"
cat > "app/src/main/res/drawable/ic_stat.xml" <<'__XH_EOF__'
<vector xmlns:android="http://schemas.android.com/apk/res/android" android:width="24dp" android:height="24dp" android:viewportWidth="24" android:viewportHeight="24">
    <path android:fillColor="#FFFFFF" android:pathData="M11,2h2v7h-2z M11,15h2v7h-2z M2,11h7v2h-7z M15,11h7v2h-7z" />
</vector>
__XH_EOF__
mkdir -p "app/src/main/res/mipmap-anydpi-v26"
cat > "app/src/main/res/mipmap-anydpi-v26/ic_launcher.xml" <<'__XH_EOF__'
<?xml version="1.0" encoding="utf-8"?>
<adaptive-icon xmlns:android="http://schemas.android.com/apk/res/android">
    <background android:drawable="@color/icbg" />
    <foreground android:drawable="@drawable/ic_fg" />
</adaptive-icon>
__XH_EOF__
mkdir -p "app/src/main/res/values"
cat > "app/src/main/res/values/colors.xml" <<'__XH_EOF__'
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <color name="icbg">#08080D</color>
</resources>
__XH_EOF__
mkdir -p "."
cat > "build.gradle.kts" <<'__XH_EOF__'
plugins {
    id("com.android.application") version "8.2.2" apply false
    id("org.jetbrains.kotlin.android") version "1.9.22" apply false
}
__XH_EOF__
mkdir -p "."
cat > "gradle.properties" <<'__XH_EOF__'
org.gradle.jvmargs=-Xmx2048m
android.useAndroidX=true
kotlin.code.style=official
__XH_EOF__
mkdir -p "gradle/wrapper"
cat > "gradle/wrapper/gradle-wrapper.properties" <<'__XH_EOF__'
distributionBase=GRADLE_USER_HOME
distributionPath=wrapper/dists
distributionUrl=https\://services.gradle.org/distributions/gradle-8.5-bin.zip
zipStoreBase=GRADLE_USER_HOME
zipStorePath=wrapper/dists
__XH_EOF__
mkdir -p "."
cat > "settings.gradle.kts" <<'__XH_EOF__'
pluginManagement { repositories { google(); mavenCentral(); gradlePluginPortal() } }
dependencyResolutionManagement { repositories { google(); mavenCentral() } }
rootProject.name = "CrosshairPro"
include(":app")
__XH_EOF__
