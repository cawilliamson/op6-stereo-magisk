# create directory structure
mkdir -p $INSTALLER$SYS/vendor/etc

# copy original files to module (magisk only)
$MAGISK && cp_ch_nb $VEN/etc/audio_policy_configuration.xml $INSTALLER$SYS/vendor/etc/audio_policy_configuration.xml 0644
$MAGISK && cp_ch_nb $VEN/etc/mixer_paths_tavil.xml $INSTALLER$SYS/vendor/etc/mixer_paths_tavil.xml 0644

# change to vendor dir
cd $INSTALLER$SYS/vendor/etc

# copy audio policy config to correct path (treskmod workaround)
if [ -f audio/audio_policy_configuration.xml ]; then
  cp -f audio/audio_policy_configuration.xml audio_policy_configuration.xml
fi

# patch mixer paths
patch -p1 -N &>/dev/null <<'EOF'
--- a/mixer_paths_tavil.xml
+++ b/mixer_paths_tavil.xml
@@ -401,3 +401,3 @@
     <!-- CDC_IF and SLIM controls -->
-    <ctl name="SLIM RX0 MUX" value="ZERO" />
+    <ctl name="SLIM RX0 MUX" value="AIF1_PB" />
     <ctl name="SLIM RX1 MUX" value="ZERO" />
@@ -431,3 +431,3 @@
     <!-- Interpolator chain controls -->
-    <ctl name="RX INT0_1 MIX1 INP0" value="ZERO" />
+    <ctl name="RX INT0_1 MIX1 INP0" value="RX0" />
     <ctl name="RX INT0_1 MIX1 INP1" value="ZERO" />
@@ -588,3 +588,11 @@
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
@@ -656,3 +664,11 @@
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
@@ -728,3 +744,11 @@
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
@@ -798,3 +822,11 @@
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
EOF

# return to original dir
cd - &>/dev/null

# enable aml support (magisk only)
$MAGISK && cp -f $INSTALLER/common/aml.sh $UNITY/.aml.sh
