if [ "$MAGISK_VER_CODE" -lt 24000 ]; then
ui_print "*********************************************************"
ui_print "! Please install Magisk v24+"
abort    "*********************************************************"
fi
[ -x "$(which magisk)" ] && CMDPREFIX="magisk --denylist exec" || unset CMDPREFIX
CHECK_DIRS="/system /vendor /product /system_ext"
EXISTING_DIRS=""
for dir in $CHECK_DIRS; do
[[ -d "$dir" ]] && EXISTING_DIRS="$EXISTING_DIRS $dir"
done
CFGS=$($CMDPREFIX find $EXISTING_DIRS -type f -name WCNSS_qcom_cfg.ini)
for CFG in $CFGS
do
[[ -f $CFG ]] && {
mkdir -p `dirname $MODPATH$CFG`
ui_print "- Migrating $CFG"
$CMDPREFIX cp -af $CFG $MODPATH$CFG
ui_print "- Starting modifiy"
sed -i '/gChannelBondingMode24GHz=/d;/gChannelBondingMode5GHz=/d;/gForce1x1Exception=/d;/sae_enabled=/d;/BandCapability=/d;s/^END$/gChannelBondingMode24GHz=1\ngChannelBondingMode5GHz=1\ngForce1x1Exception=0\nsae_enabled=1\nBandCapability=0\nEND/g' $MODPATH$CFG
}
done
[[ -z $CFG ]] && abort "- Installation FAILED. Your device didn't support WCNSS_qcom_cfg.ini." || { mkdir -p $MODPATH/system; mv -f $MODPATH/vendor $MODPATH/system/vendor; mv -f $MODPATH/product $MODPATH/system/product; mv -f $MODPATH/system_ext $MODPATH/system/system_ext;}
