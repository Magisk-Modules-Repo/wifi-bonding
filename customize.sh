array=$(find /system /vendor -name WCNSS_qcom_cfg.ini)
for CFG in $array
do
[[ -f $CFG ]] && [[ ! -L $CFG ]] && {
SELECTPATH=$CFG
mkdir -p `dirname $MODPATH$CFG`
ui_print "- Migrating $CFG"
[[ -f /sbin/.magisk/mirror$SELECTPATH ]] && cp -af /sbin/.magisk/mirror$SELECTPATH $MODPATH$SELECTPATH || cp -af $SELECTPATH $MODPATH$SELECTPATH
ui_print "- Starting modifiy"
sed -i 's/gChannelBondingMode24GHz=0/gChannelBondingMode24GHz=1/g;s/gChannelBondingMode5GHz=0/gChannelBondingMode5GHz=1/g;s/#gChannelBondingMode24GHz=1/gChannelBondingMode24GHz=1/g;s/#gChannelBondingMode5GHz=1/gChannelBondingMode5GHz=1/g;s/gForce1x1Exception=1/gForce1x1Exception=0/g;s/#gForce1x1Exception=0/gForce1x1Exception=0/g' $MODPATH$SELECTPATH
[[ -z $(grep -v "^#" $MODPATH$SELECTPATH | grep gChannelBondingMode24GHz) ]] && sed -i 's/^END$/gChannelBondingMode24GHz=1\nEND/g' $MODPATH$SELECTPATH
[[ -z $(grep -v "^#" $MODPATH$SELECTPATH | grep gChannelBondingMode5GHz) ]] && sed -i 's/^END$/gChannelBondingMode5GHz=1\nEND/g' $MODPATH$SELECTPATH
[[ -z $(grep -v "^#" $MODPATH$SELECTPATH | grep gForce1x1Exception) ]] && sed -i 's/^END$/gForce1x1Exception=0\nEND/g' $MODPATH$SELECTPATH
}
done
[[ -z $SELECTPATH ]] && abort "- Installation FAILED. Your device didn't support WCNSS_qcom_cfg.ini." || { mkdir -p $MODPATH/system; mv -f $MODPATH/vendor $MODPATH/system/vendor;}
