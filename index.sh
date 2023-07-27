#!/usr/bin/env bash


zero_app_nsh="./`basename $0`"

zero_app_msg_usage="
usage:
${zero_app_nsh} [configfile]
${zero_app_nsh} [command]

command:
    version -- output cli version
    help -- output usage
options:
    -v,--version -- output version
    -h,--help -- output help msg
"
zero_app_msg_version="${zero_app_nsh} version 1.0.0"


#zero:task:s:out-cli-version
# if [ $1"_" = "version_" ];then
#     echo "$zero_app_msg_version"
#     exit 0
# fi
case "$1" in
    -v|--version|version)
        echo "$zero_app_msg_version"
        exit 0
        ;;
esac
#zero:task:e:out-cli-version

#zero:task:s:out-usage
case "$1" in
    -h|--help|help)
        echo "$zero_app_msg_usage"
        exit 0
        ;;
esac

# if [ $# -ne 1 ];then
#     echo "$zero_app_msg_usage"
#     exit 1
# fi

# if [ $1"_" = "help_" ];then
#     echo "$zero_app_msg_usage"
#     exit 0
# fi
#zero:task:e:out-usage


#zero:task:s:set-default-value
# config="
# microk8s version,zero_app_ver_reg_3,microk8s
# docker -v,zero_app_ver_reg_3,docker
# microk8s ctr --version,zero_app_ver_reg_3,containerd
# "

config="
git --version,zero_app_ver_reg_3,git
node --version,zero_app_ver_reg_3,node
npm --version,zero_app_ver_reg_3,npm
pnpm --version,zero_app_ver_reg_3,pnpm
nrm --version,zero_app_ver_reg_3,nrm
docker -v,zero_app_ver_reg_3,docker
"
#zero:task:e:set-default-value

#zero:task:s:bind-scr-level-args-value
# [ -n "$1" ] && [ -e $1 ] && config=`cat $1`
[ -n "$1" ] && {
    if [ -e $1 ] ;then
        config=`cat $1`
    else
        echo "warn: no such file $1"
        exit 1
    fi
}
#zero:task:e:bind-scr-level-args-value



#zero:task:s:get-main-soft-version
zero_app_ver_reg_3="[0-9]{1,}\.[0-9]{1,}.[0-9]{1,}"
zero_app_ver_reg_2="[0-9]{1,}\.[0-9]{1,}"
#zero:task:e:get-main-soft-version

# todo:

#zero:task:s:get space md5
zero_const_space_md5=`echo -n " " | md5sum | cut -b -32`
#zero:task:e:get space md5


function zero_app_avr_out(){

# zero_const_space_md5=$2

opts="$1"
space_md5=$2
space=$3

opts=`echo "$opts" | sed "s/$space/$space_md5/g" `
# echo "$opts"
array=(`echo "$opts"`)

id=0
for line in ${array[@]}
do
if [ "$line" ]; then
    vline=`echo "$line" | sed "s/$space_md5/$space/g" `
    # echo "$vline"
    IFS_BK=$IFS;IFS=",";vla=($vline);IFS=$IFS_BK;
    # echo ${vla[0]}
    # echo ${vla[1]}
    # echo ${vla[2]}

    zero_app_avr_cmd=${vla[0]}
    zero_app_avr_ver_reg=${vla[1]}
    zero_app_avr_name=${vla[2]}

    shcode=`zero_app_get_shcode "$zero_app_avr_cmd" "$zero_app_avr_ver_reg" "$zero_app_avr_name"`
    eval "$shcode"
    
fi
done 

}


function zero_app_get_shcode(){
    zero_app_avr_cmd=$1
    zero_app_avr_ver_reg=$2
    zero_app_avr_name=$3

    zero_app_shcode=$(cat <<EOF
ver=\`$zero_app_avr_cmd | grep -oE "\$$zero_app_avr_ver_reg"\`;echo "$zero_app_avr_name \$ver"
EOF
)
    echo $zero_app_shcode
    # eval $zero_app_shcode
}

# function zero_app_avr_run_sh_old(){
#     zero_app_avr_cmd=$1
#     zero_app_avr_ver_reg=$2
#     zero_app_avr_name=$3

#     # echo "$zero_app_avr_cmd" 
#     msg=`$zero_app_avr_cmd`
#     # echo "$msg"

#     reg="echo \$$zero_app_avr_ver_reg"
#     reg=`eval "$reg"`
#     # echo "$reg"

#     ver=`echo "$msg" | grep -oE "$reg"`
#     echo "$zero_app_avr_name $ver"
# }
# # zero_app_avr_run_sh_old "$zero_app_avr_cmd" "$zero_app_avr_ver_reg" "$zero_app_avr_name"

zero_app_avr_out "$config" "$zero_const_space_md5" " "

# ./index.sh
# /mnt/d/code/shell/app-ver-out/index.sh

# chmod +x ./index.sh