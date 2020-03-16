#The compact file is write-only and trigger compaction for
#allocator zrm uses. The allocator moves some objects so that
#it could free fragment space.

echo 1 > /sys/block/zram0/compact
echo 1 > /sys/block/zram1/compact
echo 1 > /sys/block/zram2/compact
echo 1 > /sys/block/zram3/compact
