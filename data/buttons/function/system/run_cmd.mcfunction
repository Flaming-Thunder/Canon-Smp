execute as @a if function buttons:system/same_uuid run tag @s add button.user

#tellraw @a {nbt:"temp.userUUID",storage:"buttons:storage"}

$$(cmd)


tag @a[tag=button.user] remove button.user

