# change to vendor dir
cd $UNITY$VEN/etc

# remove patch
busybox patch -p1 -R <<'EOF'
--- a/mixer_paths_tavil.xml
+++ b/mixer_paths_tavil.xml
@@ -399,7 +399,7 @@

     <ctl name="AMIC4_5 SEL" value="AMIC4" />
     <!-- CDC_IF and SLIM controls -->
-    <ctl name="SLIM RX0 MUX" value="ZERO" />
+    <ctl name="SLIM RX0 MUX" value="AIF1_PB" />
     <ctl name="SLIM RX1 MUX" value="ZERO" />
     <ctl name="SLIM RX2 MUX" value="ZERO" />
     <ctl name="SLIM RX3 MUX" value="ZERO" />
@@ -429,7 +429,7 @@
     <ctl name="CDC_IF TX13 MUX" value="ZERO" />

     <!-- Interpolator chain controls -->
-    <ctl name="RX INT0_1 MIX1 INP0" value="ZERO" />
+    <ctl name="RX INT0_1 MIX1 INP0" value="RX0" />
     <ctl name="RX INT0_1 MIX1 INP1" value="ZERO" />
     <ctl name="RX INT0_1 MIX1 INP2" value="ZERO" />
     <ctl name="RX INT1_1 MIX1 INP0" value="ZERO" />
@@ -586,7 +586,15 @@
 <!-- #ifdef VENDOR_EDIT -->
 <!-- wangdongdong@MultiMediaService,2016/10/01,add i2s path-->
     <path name="deep-buffer-playback quat_i2s">
+	<ctl name="SLIMBUS_0_RX Audio Mixer MultiMedia1" value="1" />
+        <ctl name="SLIM RX0 MUX" value="AIF1_PB" />
+        <ctl name="SLIM_0_RX Channels" value="One" />
+        <ctl name="RX INT0_1 MIX1 INP0" value="RX0" />
+        <ctl name="RX INT0 DEM MUX" value="CLSH_DSM_OUT" />
+        <ctl name="EAR PA Gain" value="G_6_DB" />
+        <ctl name="RX0 Digital Volume" value="86" />
         <ctl name="QUAT_MI2S_RX Audio Mixer MultiMedia1" value="1" />
+		<ctl name="RX0 HPF cut off" value="MIN_3DB_150Hz"/>
     </path>
 <!--#endif-->

@@ -654,7 +662,15 @@
 <!-- #ifdef VENDOR_EDIT -->
 <!-- wangdongdong@MultiMediaService,2016/10/01,add i2s path-->
     <path name="low-latency-playback quat_i2s">
+	<ctl name="SLIMBUS_0_RX Audio Mixer MultiMedia5" value="1" />
+        <ctl name="SLIM RX0 MUX" value="AIF1_PB" />
+        <ctl name="SLIM_0_RX Channels" value="One" />
+        <ctl name="RX INT0_1 MIX1 INP0" value="RX0" />
+        <ctl name="RX INT0 DEM MUX" value="CLSH_DSM_OUT" />
+        <ctl name="EAR PA Gain" value="G_6_DB" />
+        <ctl name="RX0 Digital Volume" value="86" />
         <ctl name="QUAT_MI2S_RX Audio Mixer MultiMedia5" value="1" />
+		<ctl name="RX0 HPF cut off" value="MIN_3DB_150Hz"/>
     </path>
 <!--#endif-->

@@ -726,7 +742,15 @@
 <!-- #ifdef VENDOR_EDIT -->
 <!-- wangdongdong@MultiMediaService,2016/10/01,add i2s path-->
     <path name="audio-ull-playback quat_i2s">
+	<ctl name="SLIMBUS_0_RX Audio Mixer MultiMedia8" value="1" />
+        <ctl name="SLIM RX0 MUX" value="AIF1_PB" />
+        <ctl name="SLIM_0_RX Channels" value="One" />
+        <ctl name="RX INT0_1 MIX1 INP0" value="RX0" />
+        <ctl name="RX INT0 DEM MUX" value="CLSH_DSM_OUT" />
+        <ctl name="EAR PA Gain" value="G_6_DB" />
+        <ctl name="RX0 Digital Volume" value="86" />
         <ctl name="QUAT_MI2S_RX Audio Mixer MultiMedia8" value="1" />
+		<ctl name="RX0 HPF cut off" value="MIN_3DB_150Hz"/>
     </path>
 <!--#endif-->
     <path name="audio-ull-playback speaker-protected">
@@ -796,7 +820,15 @@
 <!-- #ifdef VENDOR_EDIT -->
 <!-- wangdongdong@MultiMediaService,2016/10/01,add i2s path-->
     <path name="compress-offload-playback quat_i2s">
+	<ctl name="SLIMBUS_0_RX Audio Mixer MultiMedia4" value="1" />
+        <ctl name="SLIM RX0 MUX" value="AIF1_PB" />
+        <ctl name="SLIM_0_RX Channels" value="One" />
+        <ctl name="RX INT0_1 MIX1 INP0" value="RX0" />
+        <ctl name="RX INT0 DEM MUX" value="CLSH_DSM_OUT" />
+        <ctl name="EAR PA Gain" value="G_6_DB" />
+        <ctl name="RX0 Digital Volume" value="86" />
         <ctl name="QUAT_MI2S_RX Audio Mixer MultiMedia4" value="1" />
+		<ctl name="RX0 HPF cut off" value="MIN_3DB_150Hz"/>
     </path>
 <!--#endif-->
     <path name="compress-offload-playback speaker-protected">
EOF >/dev/null 2>&1

# return to original dir
cd -
