#RAID 0
#把多块物理硬盘设备(至少2块)通过硬件或软件的方式串联在一起,
#组成一个大的卷组，并将数据依次写入各个物理硬盘中,
#其中任意一块磁盘发生故障都会顺怀整个系统的数据



#RAID 1
#把两块以上的磁盘设备进行绑定，在写入数据时，是将数据同时写入多块硬盘设备
#可以将其视为数据的镜像或备份



#LVM 
fdisk -l  #查看分区类型，默认分区类型是以LVM类型分区的
#如果当前磁盘没有完全被使用，则新建分区，
fdisk /dev/sda
Command (m for help): p    #查看分区表
#创建好分区之后修改分区类型
Command (m for help): t  
Partition number (1,2, default 2): 2        #选择分区
Hex code (type L to list all codes): L      #查看类型的code
Hex code (type L to list all codes): 8e
Command (m for help): w

#如果分区已经被使用完，则挂载新的磁盘进行分区
fdisk /dev/sdb

#将新加的分区 /dev/sdb1 创建为物理卷
pvcreate /dev/sdb1
#查看物理卷
pvdisplay


#查看卷组列表，卷组名为centos
vgdisplay


#给卷组centos扩容
vgextend centos  /dev/sdb1
#再次查看卷组Free PE 已经增多
vgdisplay

#将卷组剩余的所有空间都扩展到lV(root)
lvextend -l +100%FREE /dev/mapper/centos-root

#查看文件系统
cat /etc/fstab

#写入文件系统使扩容生效
xfs_growfs /dev/mapper/centos-root    #xfs文件系统
resize2fs /dev/mapper/centos-root     #ext4文件系统
#查看磁盘容量
df -h 




