/*
 * fuseSetUp.h
 *
 * Created: 03.12.2011 12:32:46
 *  Author: Stuart.Cording
 */ 


#ifndef FUSESETUP_H_
#define FUSESETUP_H_

FUSES = 
{
    .low = (FUSE_SUT0),
    .high = HFUSE_DEFAULT, //(FUSE_BOOTSZ0 & FUSE_BOOTSZ1 & FUSE_EESAVE & FUSE_SPIEN & FUSE_JTAGEN),
    .extended = EFUSE_DEFAULT,
};

#endif /* FUSESETUP_H_ */