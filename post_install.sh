#!/bin/bash

declare -r vpc_cidr_block="10.0.0.0/16"
declare -r vpc_id="vpc-f2be2597"
declare -r vpc_name="MyRFD-eu-west-1"
declare -r igw_id="igw-d30dbab6"
declare -r subnet_nat="subnet-18631e6f"
declare -r route_table_nat="rtb-d4e79ab1"
declare -r subnet_myrfd="subnet-0c631e7b"
declare -r sg_id_nat="sg-2f827e4b"
declare -r sg_id_myrfd="sg-37827e53"
declare -r additional_sg="sg-33827e57"
declare -r nat_id="i-044401a5"
declare -r myrfd_id="i-ca82b36b"
declare -r nat_public_dns_name="ec2-52-18-18-156.eu-west-1.compute.amazonaws.com"
declare -r nat_public_ip="52.18.18.156"
declare -r nat_private_ip="10.0.254.100"
declare -r myrfd_private_ip="10.0.254.200"

declare -rx stackId="397"
declare -r subnet_master_id="subnet-75ad6303"
declare -r subnet_master="10.0.2.0/25"
declare -r subnet_compute="10.0.2.128/25"
declare -r master_full_ip="10.0.2.101"
declare -r compute_type="m4.10xlarge"
declare -r g2_type="g2.8xlarge"
declare -r g2_private_ip="10.0.2.102"
declare -r organization_name="YPF"
declare -r team_name="Cloud testing"
declare -r cfncluster_name="vpc-MyRFD-eu-west-1-stack-397-net-2"
declare -r aws_s3_stack_info="MyRFD-eu-west-1/meta-data/stack-397-net-2"
declare -r aws_s3_team_data="MyRFD-eu-west-1/organizations/YPF/Cloud-testing"

declare -rx AWS_DEFAULT_REGION="eu-west-1"
declare -r AWS_BUCKET="nice-myrfd-eu-west-1"
declare -Air AWS_INSTANCE_TYPE_VCPU_NUMBER='([c3.large]="2" [r3.4xlarge]="16" [c3.2xlarge]="8" [d2.8xlarge]="36" [d2.2xlarge]="8" [r3.2xlarge]="8" [i2.4xlarge]="16" [i2.2xlarge]="8" [c3.8xlarge]="32" [m4.2xlarge]="8" [g2.8xlarge]="32" [c4.xlarge]="4" [d2.xlarge]="4" [m3.2xlarge]="8" [t2.large]="2" [m3.large]="2" [c3.xlarge]="4" [c4.4xlarge]="16" [m4.4xlarge]="16" [m4.10xlarge]="40" [t2.small]="1" [i2.8xlarge]="32" [m4.xlarge]="4" [m3.xlarge]="4" [c4.2xlarge]="8" [c3.4xlarge]="16" [r3.large]="2" [g2.2xlarge]="8" [i2.xlarge]="4" [m4.large]="2" [r3.xlarge]="4" [t2.micro]="1" [t2.medium]="2" [r3.8xlarge]="32" [c4.large]="2" [d2.4xlarge]="16" [c4.8xlarge]="36" [m3.medium]="1" )'

declare -r javahome="/opt/nice/jdk1.8.0_60"
declare -r nicedir="/opt/nice"
declare -r sharednice="/shared/nice"
declare -r openlava_top="/opt/openlava-2.2"
declare -r ec2_user="ec2-user"
declare -r primaryEmailAddress="professionalservices@nice-software.com"
declare -r efadmin="efadmin"
declare -r efgroup="efadmin"
declare -r efgecos="EnginFrame Administrator"
declare -ir efadminGID="1000"
declare -ir efadminUID="1000"
declare -ir rfdgw_session_timeout="720"
declare -r ldap_manager="cn=manager"
declare -ar ldap_domain='([0]="myrfd" [1]="com")'

declare -r impi_top="/usr/local/intel/impi"
declare -r impi_ver="4.1.3.049"
declare -r shareddata="/shared/data"
declare -r sharedtnav="/shared/tnav"
declare -ir tnav_default_thread_count="36"
declare -r tnav_default_queue="normal"
declare -ir tnav_dispatcher_port="5555"

declare -ir socksPort="1080"

declare -Ar file_list='([efplugins]="efplugins.tar.gz" [openlava]="openlava-2.2-2.x86_64.rpm" [tnav-data1]="SpeedTestModel.zip" [tnav-data2]="SpeedTestLarge.zip" [tnav-data3]="SpeedTestLarge_short.zip" [enginframe]="enginframe-2015.0-r36730.jar" [dante]="dante-1.4.1-1.el6.x86_64.rpm" [tnav-ini]="queue_viewers.ini" [mpirun]="impi-mpirun" [tnav-license]="license.dat" [tnav-conf]="tNavigator.conf" [tnav-license-status]="tNavigator-license_status-Linux-64.zip" [jdk]="jdk-8u60-linux-x64.tar.gz" [tnav-con]="tNavigator-con-Linux-64.zip" [tnav-con-mpi]="tNavigator-con-mpi-Linux-64.zip" [dcv]="nice-dcv-2014.0-16231.run" [elim]="elim" [impi]="impi-4.1.3.049.tar.gz" [get-pip]="get-pip.py" [tnav-logo]="rfdlogo.png" [tnav-dispatcher]="tNavigator-dispatcher-install-Linux-64.zip" [dante-server]="dante-server-1.4.1-1.el6.x86_64.rpm" [tnav-guiapp]="tNavigator-Linux-64.zip" )'

#!/bin/bash

declare -ra yumArgs=(
    -y
    --disablerepo lustre-client
    --enablerepo epel
)

declare -ra yumGroups=(
    'X Window System' 'Fonts' 'Desktop'
    'General Purpose Desktop' 'Desktop Platform'
    'Internet Browser' 'Xfce'
)

declare -ra yumPackages=(
    tree pam_ldap pam_krb5 nss-tools nss-pam-ldapd
    openldap-clients sssd sssd-client sssd-tools
    sssd-common sssd-common-pac sssd-ldap sssd-proxy
    python-sssdconfig authconfig authconfig-gtk
    ImageMagick unzip psmisc
)

declare -r  myIpAddress=$(hostname -i)

declare -r  ldap_suffix="$(IFS=','; echo "${ldap_domain[*]/#/dc=}")"

declare -r  cacert_nickname='CA certificate'
declare -r  cacert_trustargs='CT,,'
declare -r  cacert_subject='cn=CAcert'
declare -r  ldapcert_nickname='OpenLDAP Server'
declare -r  ldapserver_trustargs='u,u,u'
declare -r  ldapserver_subject="cn=${myIpAddress}"
declare -ri valid_months=120
declare -r  certs='/etc/openldap/certs'
declare -r  cacerts='/etc/openldap/cacerts'
declare -r  password_file="${certs}/password"
declare -r  noise_file="${certs}/noise.txt"
declare -r  cacert_file="${certs}/cacert.pem"

declare -r wgetBase="https://ip-${nat_private_ip//./-}/pkgs"
declare -ra wgetArgs=(
    --quiet
    --no-check-certificate
    --directory-prefix "${nicedir}/pkgs"
)

declare -r logFile="${nicedir}/logs/stack.configure.log.txt"
mkdir -p "${nicedir}/logs" "${nicedir}/pkgs"
touch "${logFile}"
chown -R "root:${ec2_user}" "${nicedir}/logs" "${nicedir}/pkgs"
chmod 750 "${nicedir}/logs" "${nicedir}/pkgs"

mailLog() {
    local -r  from="postinstall@myrfd.${AWS_DEFAULT_REGION}.rfdyn.com"
    local -r  to="${primaryEmailAddress}"
    local -r  net_id=$(echo "${myIpAddress}" | cut -d '.' -f 3)
    local -rA node_type=([${master_full_ip}]='Master' [${g2_private_ip}]='DCV')
    local -r  subject="[MyRFD] ${vpc_name}/${organization_name}/${team_name}/${net_id}"
    local -r  body="Post-install report: ${node_type[${myIpAddress}]:-Compute} Node, ${myIpAddress}"
    local -r  file="${logFile}"
    mail -s "${subject}" -r "${from}" -a "${file}" "${to}" <<< "${body}"
}

trap mailLog EXIT

set -e
set -u
set -x

main() {

    if [[ ! -f ${nicedir}/logs/yum.done ]]; then
        install_packages
        echo 'do not remove' > "${nicedir}/logs/yum.done"
    fi

    configure_ldap_client

    if [[ ${myIpAddress} == ${master_full_ip} ]]; then
        if [[ ! -f ${nicedir}/logs/slapd.done ]]; then
            configure_ldap_server
            echo 'do not remove' > "${nicedir}/logs/slapd.done"
        fi
        configure_ldap_certificate
        chkconfig --add slapd
        chkconfig slapd on
        service slapd start
    fi

    configure_auth
    configure_idmapd
    configure_sudo
    configure_ssh_config
    configure_ssh_keygen

    if [[ ${myIpAddress} == ${master_full_ip} ]]; then
        configure_nfs_server
        configure_tNavigator
        configure_enginframe
        configure_openlava_on_master
    fi

    configure_mpi

    if [[ ${myIpAddress} == ${g2_private_ip} ]]; then
        configure_nfs_client
        unconfigure_firstboot
        configure_xorg
        configure_dcv
        configure_openlava_on_g2
    fi

    # the stuff created by this function will be stored statically in a future custom AMI
    configure_openlava

    echo 'stack.configure.sh end'
}

configure_openlava_on_master() {
    set +u
    source "${openlava_top}/etc/openlava.sh"
    set -u
    badmin hopen "ip-${master_full_ip//./-}"
}

configure_openlava_on_g2() {
    printf 'cfn_master=%s\n' "ip-${master_full_ip//./-}" > '/opt/cfncluster/cfnconfig'
    '/opt/cfncluster/scripts/openlava/boot_as_compute'
    su - "${ec2_user}" <<EOF
ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null "${master_full_ip}" sudo su --login <<EOF2
source "${openlava_top}/etc/openlava.sh"
lsaddhost -t linux -m IntelXeon "ip-${g2_private_ip//./-}"
EOF2
EOF
}

configure_openlava() {
    local -r elim="${openlava_top}/sbin/elim"
    local -r lsfshared="${openlava_top}/etc/lsf.shared"
    local -r lsfcluster="${openlava_top}/etc/lsf.cluster.openlava"
    local -r lsfconf="${openlava_top}/etc/lsf.conf"
    local -r lsbqueues="${openlava_top}/etc/lsb.queues"
    wget "${wgetArgs[@]}" "${wgetBase}/${file_list[elim]}"
    mv -f "${nicedir}/pkgs/${file_list[elim]}" "${elim}"
    chown openlava:openlava "${elim}"
    chmod 755 "${elim}"
    sed -i 's/End Resource/dcv  Numeric 60  N  (DCV NODE)\n&/g' "${lsfshared}"
    sed -i 's/End Resource/hpc  Numeric 60  N  (HPC NODE)\n&/g' "${lsfshared}"
    sed -i 's/End Resource/data  Numeric 60  N  (DATA NODE)\n&/g' "${lsfshared}"
    sed -i 's/End ResourceMap/dcv  [default]\n&/g' "${lsfcluster}"
    sed -i 's/End ResourceMap/hpc  [default]\n&/g' "${lsfcluster}"
    sed -i 's/End ResourceMap/data  [default]\n&/g' "${lsfcluster}"
    sed -i '/^LSB_STDOUT_DIRECT/d' "${lsfconf}"
    echo 'LSB_STDOUT_DIRECT=y' >> "${lsfconf}"
    sed -i 's/^[[:space:]]*QUEUE_NAME[[:space:]]*=[[:space:]]*normal/&\nRES_REQ = select[hpc]/g' "${lsbqueues}"
    sed -i '/^NICE[[:space:]]*=/d' "${lsbqueues}"
    cat >> "${lsbqueues}" <<EOF

Begin Queue
QUEUE_NAME          = dcv
RES_REQ             = select[dcv]
JOB_ACCEPT_INTERVAL = 0
NEW_JOB_SCHED_DELAY = 0
PRIORITY            = 50
EXCLUSIVE           = y
ADMINISTRATORS      = efadmin
DESCRIPTION         = Queue for linux interactive applications
End Queue

Begin Queue
QUEUE_NAME          = transfer
RES_REQ             = select[data]
JOB_ACCEPT_INTERVAL = 0
NEW_JOB_SCHED_DELAY = 0
PRIORITY            = 50
EXCLUSIVE           = y
ADMINISTRATORS      = efadmin
DESCRIPTION         = Queue for data synchronization
End Queue
EOF

    service openlava restart

}

configure_xorg() {
    init 3
    mv '/usr/lib64/xorg/modules/extensions/libglx.so' \
       '/usr/lib64/xorg/modules/extensions/libglx.so.xorg'
    ln -s '/usr/lib64/xorg/modules/extensions/libglx.so.346.47' \
          '/usr/lib64/xorg/modules/extensions/libglx.so'
    rm -f '/etc/X11/xorg.conf'
    nvidia-xconfig \
        --preserve-busid \
        --enable-all-gpus \
        --use-display-device="None"
    init 5
    wait_for_xorg
    init 3
}

wait_for_xorg() {
    sleep 10
    runlevel; fgconsole
    ps -ef | egrep 'gdm|Xorg'
    ls -laR --full-time /tmp/.X* || true
}

configure_dcv() {
    cat > '/etc/profile.d/dcv.sh' <<'EOF'
#!/bin/bash
declare -x __GL_SHADER_DISK_CACHE_PATH="/tmp/.nv.${USER}"
mkdir -p "${__GL_SHADER_DISK_CACHE_PATH}"
EOF
    chmod 755 '/etc/profile.d/dcv.sh'
    cat > '/etc/profile.d/dcv.csh' <<'EOF'
#!/bin/csh
setenv __GL_SHADER_DISK_CACHE_PATH "/tmp/.nv.${USER}"
mkdir -p "${__GL_SHADER_DISK_CACHE_PATH}"
EOF
    chmod 755 '/etc/profile.d/dcv.csh'
    wget "${wgetArgs[@]}" "${wgetBase}/${file_list[dcv]}"
    chmod 750 "${nicedir}/pkgs/${file_list[dcv]}"
    "${nicedir}/pkgs/${file_list[dcv]}" -- --batch
    rm -f "${nicedir}/pkgs/${file_list[dcv]}"
    mv "${nicedir}/pkgs/g2.license.lic" '/opt/nice/dcv/license/license.lic'
    init 5
    wait_for_xorg
    dcvdiag
}

unconfigure_firstboot() {
    chkconfig --list firstboot
    service firstboot stop
    chkconfig firstboot off
    chkconfig --del firstboot
}

configure_mpi() {
    mkdir -p "${impi_top}"
    wget "${wgetArgs[@]}" "${wgetBase}/${file_list[impi]}"
    tar --directory "${impi_top}" -zxf "${nicedir}/pkgs/${file_list[impi]}"
    ln -sf "${impi_top}/${impi_ver}/bin64/mpivars.sh" '/etc/profile.d/mpivars.sh'
    rm -f "${nicedir}/pkgs/${file_list[impi]}"

    wget "${wgetArgs[@]}" "${wgetBase}/${file_list[mpirun]}"
    mv -f "${nicedir}/pkgs/${file_list[mpirun]}" "${openlava_top}/bin/${file_list[mpirun]}"
    chmod 755 "${openlava_top}/bin/${file_list[mpirun]}"
}

configure_nfs_server() {
    cat > '/etc/exports' <<EOF
/home 10.0.0.0/16(rw,no_root_squash,sync)
/shared 10.0.0.0/16(rw,no_root_squash,sync)
/opt/sge 10.0.0.0/16(rw,no_root_squash,sync)
EOF
    exportfs -rav
}

configure_tNavigator() {
    local -r tnav_setup="${nicedir}/bin/myrfd.tnav-setup.sh"
    local -r tnav_desktop='/etc/skel/Desktop/tNavigator.desktop'
    mkdir -p \
        "${nicedir}/bin" \
        "${shareddata}" \
        "${sharedtnav}" \
        '/etc/skel/Desktop' \
        '/etc/skel/.config/RFDynamics/tNavigator'
    local -ra tnav_files=(
        "${file_list[tnav-con]}"
        "${file_list[tnav-con-mpi]}"
        "${file_list[tnav-dispatcher]}"
        "${file_list[tnav-guiapp]}"
        "${file_list[tnav-data1]}"
        "${file_list[tnav-data2]}"
        "${file_list[tnav-data3]}"
        "${file_list[tnav-license-status]}"
    )
    local -- file=''
    for file in "${tnav_files[@]}"; do
        wget "${wgetArgs[@]}" "${wgetBase}/${file}"
        unzip -d "${sharedtnav}" "${nicedir}/pkgs/${file}"
        rm -f "${nicedir}/pkgs/${file}"
    done
    mv "${sharedtnav}/$(basename "${file_list[tnav-data1]}" '.zip')" \
       "${sharedtnav}/$(basename "${file_list[tnav-data2]}" '.zip')" \
       "${sharedtnav}/$(basename "${file_list[tnav-data3]}" '.zip')" \
        "${shareddata}"
    chmod -R 1777 "${shareddata}"
    wget "${wgetArgs[@]}" "${wgetBase}/${file_list[tnav-license]}"
    mv "${nicedir}/pkgs/${file_list[tnav-license]}" "${sharedtnav}/tnav.license.dat"
    wget "${wgetArgs[@]}" "${wgetBase}/${file_list[tnav-logo]}"
    mv "${nicedir}/pkgs/${file_list[tnav-logo]}" "${sharedtnav}"
    "${sharedtnav}/tNavigator-dispatcher-install-Linux-64/install.sh" \
        --dispatcher-user=apache \
        --install-prefix="${sharedtnav}/dispatcher"
    rm -rf "${sharedtnav}/tNavigator-dispatcher-install-Linux-64"
    sed -e 's/^#source.*profile.lsf.*$/source "'"${openlava_top////\/}"'\/etc\/openlava.sh"/g' \
        -e 's/^export PATH.*$/#&/g' \
        -e 's/^export runtnav__queue_manager=.*$/export runtnav__queue_manager="openlava"/g' \
        -e 's/^export runtnav__intel_mpi_dir=.*$/export runtnav__intel_mpi_dir="'"${impi_top////\/}\/${impi_ver////\/}"'\/intel64"/g' \
        -e 's/^export runtnav__add_mpirun_params=.*$/export runtnav__add_mpirun_params="-launcher ssh -env I_MPI_DEBUG 6"/g' \
        -e 's/^export runtnav__tNavigator_dir=.*$/export runtnav__tNavigator_dir="'"${sharedtnav////\/}"'"/g' \
        -e 's/^export runtnav__license_server_ip=.*$/#&/g' \
        -e 's/^export runtnav__license_server_url=.*$/export runtnav__license_server_url="lic-set-file:\/\/${runtnav__tNavigator_dir}\/tnav.license.dat"/g' \
        -e 's/^export runtnav__default_thread_count=.*$/export runtnav__default_thread_count="'"${AWS_INSTANCE_TYPE_VCPU_NUMBER[${compute_type}]////\/}"'"/g' \
        -e 's/^export runtnav__default_queue=.*$/export runtnav__default_queue="'"${tnav_default_queue////\/}"'"/g' \
        -e 's/^export runtnav_remote_gui__dispatcher_ip=.*$/export runtnav_remote_gui__dispatcher_ip="'"${master_full_ip////\/}"'"/g' \
        -e 's/^export runtnav_remote_gui__dispatcher_port=.*$/export runtnav_remote_gui__dispatcher_port="'"${tnav_dispatcher_port////\/}"'"/g' \
      "${sharedtnav}/dispatcher/scripts/runtnav_config.sh.default" \
    > "${sharedtnav}/dispatcher/scripts/runtnav_config.sh"
    cat > "${tnav_setup}" <<'EOF'
#!/bin/bash
sed -i "s/__user__/$(id --user --name)/g" \
    "${HOME}/.config/RFDynamics/tNavigator.conf" \
    "${HOME}/.config/RFDynamics/tNavigator/queue_viewers.ini"
EOF
    cat >> "${tnav_setup}" <<EOF
sed -i 's/main__default_core_count=.*/main__default_core_count=${AWS_INSTANCE_TYPE_VCPU_NUMBER[${compute_type}]}/g' \\
    "\${HOME}/.config/RFDynamics/tNavigator.conf"
sed -i 's/model_calculation_options\\\\threads_count=.*/model_calculation_options\\\\threads_count=${AWS_INSTANCE_TYPE_VCPU_NUMBER[${compute_type}]}/g' \\
    "\${HOME}/.config/RFDynamics/tNavigator/queue_viewers.ini"
EOF
    chmod 755 "${tnav_setup}"
    cat >> '/etc/skel/.bashrc' <<EOF
if [[ -f ${tnav_setup} ]]; then
    '${tnav_setup}'
fi
EOF
    wget "${wgetArgs[@]}" \
        "${wgetBase}/${file_list[tnav-conf]}" \
        "${wgetBase}/${file_list[tnav-ini]}"
    mv "${nicedir}/pkgs/${file_list[tnav-conf]}" '/etc/skel/.config/RFDynamics'
    mv "${nicedir}/pkgs/${file_list[tnav-ini]}" '/etc/skel/.config/RFDynamics/tNavigator'
    sed -i -e "s/__master_full_ip__/$(escapeSED "${master_full_ip}")/g" \
           -e "s/__tnav_dispatcher_port__/$(escapeSED "${tnav_dispatcher_port}")/g" \
        "/etc/skel/.config/RFDynamics/${file_list[tnav-conf]}"
    cat > "${tnav_desktop}" <<EOF
#!/usr/bin/env xdg-open

[Desktop Entry]
Version=1.0
Type=Application
Terminal=false
Icon[en_US]=gnome-panel-launcher
Name[en_US]=tNavigator
Exec=${sharedtnav}/tNavigator
Name=tNavigator
Icon=${sharedtnav}/${file_list[tnav-logo]}
EOF
    chkconfig --add tnav_dispatcher_daemon
    chkconfig tnav_dispatcher_daemon on
    service tnav_dispatcher_daemon start >/dev/null 2>&1 </dev/null
}

configure_enginframe() {
    #local -ra svnArgs=(--username "${svnUsername}" --password "${svnPassword}" --non-interactive --trust-server-cert)
    local -r context="g$(echo "${master_full_ip}" | cut -d '.' -f 3)"
    local -r newjavahome="${sharednice}/$(basename "${javahome}")"
    local -- EF_VERSION=''
    wget "${wgetArgs[@]}" "${wgetBase}/enginframe.tar.gz"
    tar --directory '/' -zxvf "${nicedir}/pkgs/enginframe.tar.gz"
    rm -f "${nicedir}/pkgs/enginframe.tar.gz"
    mkdir -p "${sharednice}"
    mv "${nicedir}/enginframe" "${sharednice}/enginframe"
    mv "${javahome}" "${newjavahome}"
    sed -i "s/^JAVA_HOME=.*$/JAVA_HOME=\"${newjavahome////\/}\"/g" \
        "${sharednice}/enginframe/conf/enginframe.conf"
    sed -i "s/${nicedir////\/}/${sharednice////\/}/g" \
        '/etc/init.d/enginframe' \
        "${sharednice}/enginframe/conf/plugins/interactive/interactive.efconf"
    echo 'INTERACTIVE_DEFAULT_VNC_QUEUE=dcv' \
        >> "${sharednice}/enginframe/conf/plugins/interactive/interactive.efconf"
    source "${sharednice}/enginframe/current-version"
    sed -i 's/<session-timeout>30/<session-timeout>'"${rfdgw_session_timeout}"'/g' \
        "${sharednice}/enginframe/${EF_VERSION}/enginframe/WEBAPP/WEB-INF/web.xml"
    sed -i -e 's/${proxyServer}/ProxyServer='"${nat_public_ip}:${socksPort}"'/g' \
           -e 's/${proxyType}/proxyType=socks/g' \
        "${sharednice}/enginframe/${EF_VERSION}/enginframe/plugins/interactive/conf/template.vnc"
    echo 'VerifyId=0' >> "${sharednice}/enginframe/${EF_VERSION}/enginframe/plugins/interactive/conf/template.vnc"
    mv -f "${sharednice}/enginframe/conf/tomcat/conf/Catalina/localhost/myrfd.xml" \
          "${sharednice}/enginframe/conf/tomcat/conf/Catalina/localhost/${context}.xml"
    wget "${wgetArgs[@]}" "${wgetBase}/${file_list[efplugins]}"
    tar --directory "${sharednice}" -zxf "${nicedir}/pkgs/${file_list[efplugins]}"
    rm -f "${nicedir}/pkgs/${file_list[efplugins]}"
    chown -R "${efadmin}:${efgroup}" "${sharednice}/efplugins"
    ln -s "${sharednice}/efplugins/dcv-endstation/ef_root/plugins/dcv-endstation" \
          "${sharednice}/enginframe/${EF_VERSION}/enginframe/plugins/dcv-endstation"
    ln -s "${sharednice}/efplugins/rfd/ef_root/plugins/rfdgw" \
          "${sharednice}/enginframe/${EF_VERSION}/enginframe/plugins/rfdgw"
    ln -s "${sharednice}/efplugins/rfd-aws/ef_root/plugins/rfd-aws" \
          "${sharednice}/enginframe/${EF_VERSION}/enginframe/plugins/rfd-aws"
    ln -s "${sharednice}/efplugins/efauth/ef_root/plugins/efauth" \
          "${sharednice}/enginframe/${EF_VERSION}/enginframe/plugins/efauth"
    sed -i -e "s/__bucket__/$(escapeSED "${AWS_BUCKET}")/g" \
           -e "s/__folder__/$(escapeSED "${aws_s3_team_data}")/g" \
        "${sharednice}/enginframe/${EF_VERSION}/enginframe/plugins/rfd-aws/conf/ef.rfd-aws.conf"
  ( printf 'var aws = '
    curl --connect-timeout 1 --silent 'http://169.254.169.254/latest/dynamic/instance-identity/document'
    echo ';'
    printf 'aws["%s"] = "%s";\n' 'computeInstanceType' "${compute_type//\"/\\\"}"
    printf 'aws["%s"] = "%s";\n' 'computeInstanceVCpu' "${AWS_INSTANCE_TYPE_VCPU_NUMBER[${compute_type}]:-}"
  ) > "${sharednice}/enginframe/${EF_VERSION}/enginframe/plugins/rfdgw/WEBAPP/lib/js/myrfd.aws.js"
    echo 'EF_GRIDML_COMPRESSION="compact-execution-host"' \
        >> "${sharednice}/enginframe/conf/plugins/lsf/ef.lsf.conf"
    patch "${sharednice}/enginframe/${EF_VERSION}/enginframe/plugins/lsf/bin/bjobs.parse.awk" \
          "${sharednice}/enginframe/${EF_VERSION}/enginframe/plugins/rfdgw/misc/bjobs.parse.awk.patch"
    patch "${sharednice}/enginframe/${EF_VERSION}/enginframe/plugins/hydrogen/lib/xsl/list.jobs.data.xsl" \
          "${sharednice}/enginframe/${EF_VERSION}/enginframe/plugins/rfdgw/misc/list.jobs.data.xsl.patch"
    sed -i 's/myrfd/'"${context}"'/g' \
        "${sharednice}/enginframe/conf/enginframe/agent.conf"
    sed -i 's#/myrfd/index\.html#/'"${context}"'/rfdgw/rfdgw.xml#g' \
        "${sharednice}/enginframe/conf/tomcat/webapps/ROOT/index.html"
    cp -f "${sharednice}/enginframe/conf/tomcat/webapps/ROOT/index.html" \
        "${sharednice}/enginframe/${EF_VERSION}/enginframe/WEBAPP/index.html"
    cp -f "${sharednice}/enginframe/${EF_VERSION}/enginframe/plugins/rfdgw/WEBAPP/lib/files/favicon.ico" \
          "${sharednice}/enginframe/conf/tomcat/webapps/ROOT/favicon.ico"
    cp -f "${sharednice}/enginframe/${EF_VERSION}/enginframe/plugins/rfdgw/WEBAPP/lib/files/favicon.ico" \
          "${sharednice}/enginframe/${EF_VERSION}/enginframe/WEBAPP/images/favicon.ico"
    sed -i 's/^[[:space:]]*EF_DEFAULT_AUTHORITY[[:space:]]*=.*/EF_DEFAULT_AUTHORITY=efauth/g' \
        "${sharednice}/enginframe/conf/enginframe/server.conf"
    cat > '/etc/profile.d/enginframe.sh' <<EOF
#!/bin/bash
declare -x EF_ROOT='${sharednice}/enginframe/${EF_VERSION}/enginframe'
declare -x EF_CONF_ROOT='${sharednice}/enginframe/conf'
declare -x EF_DATA_ROOT='${sharednice}/enginframe/data'
EOF
    chmod 755 '/etc/profile.d/enginframe.sh'
    cat > '/etc/profile.d/enginframe.csh' <<EOF
#!/bin/csh
setenv EF_ROOT '${sharednice}/enginframe/${EF_VERSION}/enginframe'
setenv EF_CONF_ROOT '${sharednice}/enginframe/conf'
setenv EF_DATA_ROOT '${sharednice}/enginframe/data'
EOF
    chmod 755 '/etc/profile.d/enginframe.csh'
    chkconfig --add enginframe
    chkconfig enginframe on
    service enginframe start
}

install_packages() {
    local -r yum_conf='/etc/yum.conf'
    sed -i 's/^exclude=.*/exclude=cloud-init kernel* redhat-release*/g' "${yum_conf}"
    yum "${yumArgs[@]}" clean all
    yum "${yumArgs[@]}" makecache
    yum "${yumArgs[@]}" groupinstall "${yumGroups[@]}"
    yum "${yumArgs[@]}" install "${yumPackages[@]}"
    touch "${nicedir}/logs/yum.done"
}

configure_ldap_client() {
    local -r ldap_conf='/etc/openldap/ldap.conf'
    sed -i '/\(BASE\|URI\|TLS_REQCERT\)[[:space:]]/d' "${ldap_conf}"
  ( printf 'BASE            %s\n' "${ldap_suffix}"
    printf 'URI             ldap://%s\n' "${master_full_ip}"
    printf 'TLS_REQCERT     %s\n' 'allow'
  ) >> "${ldap_conf}"
}

configure_ldap_server() {
    local -r ldap_sysconfig='/etc/sysconfig/ldap'
    local -r ldap_password="$(
        dd if=/dev/urandom count=32 bs=1 2>/dev/null \
            | od -t x1 -An --width=32 \
            | sed 's/ //g'
    )"
    local -r rootDn="${ldap_manager},${ldap_suffix}"
    local -r pwdHash="$(slappasswd -s "${ldap_password}")"
    local -r ldap_config='cn=config'
    service slapd stop || true
    yum "${yumArgs[@]}" remove openldap-servers
    rm -rf '/etc/openldap/slapd.d/' '/var/lib/ldap/' '/var/run/openldap/'
    yum "${yumArgs[@]}" install openldap-servers
    sed -i 's/SLAPD_LDAPS=no/SLAPD_LDAPS=yes/g' "${ldap_sysconfig}"
    rm -rf "${certs}" "${cacerts}"
    mkdir -p "${certs}" "${cacerts}"
    printf "${ldap_password}" > "${password_file}"
    chown root:ldap "${password_file}"
    dd if=/dev/urandom count=1024 bs=1 2>/dev/null \
        | od -t x1 -An --width=1024 \
        | sed 's/ //g' \
      > "${noise_file}"
    certutil -N -d "${certs}" -f "${password_file}"
    certutil -G -d "${certs}" -f "${password_file}" -z "${noise_file}"
    certutil -S -d "${certs}" -f "${password_file}" -z "${noise_file}" -x -m 1000 \
        -n "${cacert_nickname}" \
        -s "${cacert_subject}" \
        -t "${cacert_trustargs}" \
        -v "${valid_months}"
    certutil -S -d "${certs}" -f "${password_file}" -z "${noise_file}" -m 1001 \
        -n "${ldapcert_nickname}" \
        -s "${ldapserver_subject}" \
        -c "${cacert_nickname}" \
        -t "${ldapserver_trustargs}" \
        -v "${valid_months}"
    certutil -L -d "${certs}" -n "${cacert_nickname}" -a > "${cacert_file}"
    chmod 644 "${certs}"/*
    chmod 440 "${password_file}"
    cp "${cacert_file}" "${cacerts}"
    chkconfig --add slapd
    chkconfig slapd off
    service slapd start
    ldapmodify -Y EXTERNAL -H ldapi:/// <<EOF
dn: olcDatabase={0}config,cn=config
changetype: modify
replace: olcRootDN
olcRootDN: ${ldap_config}
-
add: olcRootPW
olcRootPW: ${pwdHash}

dn: olcDatabase={1}monitor,cn=config
replace: olcAccess
olcAccess: {0}to * by dn.base="gidNumber=0+uidNumber=0,cn=peercred,cn=external,cn=auth" read by dn.base="${rootDn}" read by * none

dn: olcDatabase={2}bdb,cn=config
changetype: modify
replace: olcSuffix
olcSuffix: ${ldap_suffix}
-
replace: olcRootDN
olcRootDN: ${rootDn}
-
add: olcRootPW
olcRootPW: ${pwdHash}
-
add: olcAccess
olcAccess: {0}to attrs=userPassword by self write by dn.base="${rootDn}" write by anonymous auth by * none
olcAccess: {1}to * by self write by dn.base="${rootDn}" write by * read

dn: cn=config
changetype: modify
add: olcSecurity
olcSecurity: tls=1
EOF
    ldapadd -ZZ -D "${rootDn}" -y "${password_file}" <<EOF
dn: ${ldap_suffix}
dc: ${ldap_domain[0]}
objectClass: top
objectClass: domain

dn: ou=People,${ldap_suffix}
ou: People
objectClass: top
objectClass: organizationalUnit

dn: ou=Group,${ldap_suffix}
ou: Group
objectClass: top
objectClass: organizationalUnit

dn: cn=${efgroup},ou=Group,${ldap_suffix}
objectClass: top
objectClass: posixGroup
cn: ${efgroup}
userPassword: {crypt}x
gidNumber: ${efgid}

dn: uid=${efadmin},ou=People,${ldap_suffix}
objectClass: top
objectClass: posixAccount
objectClass: shadowAccount
objectClass: inetOrgPerson
cn: ${efgecos}
sn: N/A
uid: ${efadmin}
uidNumber: ${efadminUID}
gidNumber: ${efadminGID}
homeDirectory: /home/${efadmin}
loginShell: /bin/bash
gecos: ${efgecos}
userPassword: {crypt}x
shadowLastChange: 0
shadowMax: 0
shadowWarning: 0
EOF
    service slapd stop
}

configure_ldap_certificate() {
    certutil -D -d "${certs}" -n "${ldapcert_nickname}"
    certutil -S -d "${certs}" -f "${password_file}" -z "${noise_file}" -m 1001 \
        -n "${ldapcert_nickname}" \
        -s "${ldapserver_subject}" \
        -c "${cacert_nickname}" \
        -t "${ldapserver_trustargs}" \
        -v "${valid_months}"
}

configure_auth() {
    local -r sssdConf='/etc/sssd/sssd.conf'
    authconfig --disableldap --disablesssd --update
    rm -f "${sssdConf}"
    authconfig \
        --enableldap \
        --enableldapauth \
        --enableldaptls \
        --ldapserver=ldap://${master_full_ip} \
        --ldapbasedn="${ldap_suffix}" \
        --enablelocauthorize \
        --enablemkhomedir \
        --enablecachecreds \
        --enablesssd \
        --update
    sed -i 's/\[domain\/default\]/&\nenumerate = true/g' \
        "${sssdConf}"
    service sssd restart
}

configure_sudo() {
    cat > "/etc/sudoers.d/99-myrfd-${efadmin}" <<EOF
Defaults:${efadmin} !requiretty
${efadmin} ALL=(ALL) NOPASSWD:ALL
EOF
}

configure_ssh_config() {
    local -r ssh_config='/etc/ssh/ssh_config'
    sed -i '/StrictHostKeyChecking/d' "${ssh_config}"
    echo -e '\tStrictHostKeyChecking no' >> "${ssh_config}"
}

configure_ssh_keygen() {
    local -r mykeygen="${nicedir}/bin/myrfd.ssh-keygen.sh"
    mkdir -p "${nicedir}/bin"
    cat > "${mykeygen}" <<'EOF'
#!/bin/bash
# configure auto-ssh-keygen
if [[ ! -d ${HOME}/.ssh ]] \
|| [[ ! -f ${HOME}/.ssh/id_rsa ]] \
|| [[ ! -f ${HOME}/.ssh/id_rsa.pub ]]; then
    ssh-keygen -t rsa -N '' -f "${HOME}/.ssh/id_rsa" <<< $'y'
fi
cat "${HOME}/.ssh/id_rsa.pub" >> "${HOME}/.ssh/authorized_keys"
sort "${HOME}/.ssh/authorized_keys" | uniq > "${HOME}/.ssh/authorized_keys.new"
mv -f "${HOME}/.ssh/authorized_keys.new" "${HOME}/.ssh/authorized_keys"
chmod 644 "${HOME}/.ssh/authorized_keys"
EOF
    chmod 755 "${mykeygen}"
    cat >> '/etc/skel/.bashrc' <<EOF
if [[ -f ${mykeygen} ]]; then
    '${mykeygen}'
fi
EOF
}

configure_nfs_client() {
    local -r fstab='/etc/fstab'
  ( echo "ip-${master_full_ip//./-}:/home /home nfs hard,intr,noatime,vers=4,_netdev 0 0"
    echo "ip-${master_full_ip//./-}:/shared /shared nfs hard,intr,noatime,vers=4,_netdev 0 0"
  ) >> "${fstab}"
    mkdir -p '/home' '/shared'
    chmod 755 '/home' '/shared'
    mount '/home'
    mount '/shared'
}

configure_idmapd() {
    chkconfig --add rpcidmapd
    chkconfig rpcidmapd on
    if service rpcidmapd status; then
        service rpcidmapd restart
    else
        service rpcidmapd start
    fi
}


escapeSED() {
    local -- string="$1"
    echo "${string}" | egrep -v '[&/\]' && return 0
    string="${string//&/\\&}"
    string="${string////\/}"
    string="${string//\\/\\}"
    echo "${string}"
}

main "$@" 2>&1 | tee "${logFile}"
