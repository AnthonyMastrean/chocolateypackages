# Bootable Windows PE RAM Disk
*This is a scripted version of the [official instructions](http://goo.gl/FtQvU).*

Windows PE RAM enables you to start a computer for the purposes of deployment and recovery. Windows PE RAM boots directly into memory, enabling you to remove the Windows PE media after the computer boots.

This method enables you to boot directly into memory and assigns the drive letter X, which does not correspond to the media (USB flash drive or CD-ROM) from which you booted. Ensure that you have sufficient memory to support the size of your Windows PE image plus any additional memory requirements, for example, if you plan on running any customized applications that need additional working memory.