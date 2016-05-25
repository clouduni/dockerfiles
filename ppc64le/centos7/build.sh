#!/bin/sh

export pkg_name=centos7-docker.tar.xz
export pkg_root=/tmp/centos7/output
export img_name=ppc64le/centos7

export rpm_root=/tmp/centos7/build
export rpm_repo=http://mirror.centos.org/altarch/7/os/ppc64le
export rpm_epel=https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

rm -rf ${pkg_root} && mkdir -p ${pkg_root}
rm -rf ${rpm_root} && mkdir -p ${rpm_root}

rpm --root ${rpm_root} --initdb
rpm --root ${rpm_root} -ivh ${rpm_repo}/Packages/centos-release-7-2.1511.el7.centos.2.9.altarch.ppc64le.rpm
rpm --root ${rpm_root} -ivh ${rpm_epel}
rpm --root ${rpm_root} --import ${rpm_repo}/RPM-GPG-KEY-CentOS-SIG-AltArch-7-ppc64le
rpm --root ${rpm_root} --import ${rpm_repo}/RPM-GPG-KEY-CentOS-7

yum -y --installroot=${rpm_root} install yum
# chroot ${rpm_root} /bin/bash
tar -C ${rpm_root}/ -cJvf ${pkg_root}/${pkg_name} .
cat ${pkg_root}/${pkg_name} | docker import - ${img_name}:latest
