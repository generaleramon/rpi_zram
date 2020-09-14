#The compact file trigger compaction for allocator zram uses. The allocator moves some objects so that it could free fragment space

echo 1 > /sys/block/zram0/compact
echo 1 > /sys/block/zram1/compact
