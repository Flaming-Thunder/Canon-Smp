@echo off
rmdir "./data/game/function" /s /q
java -jar ./MinecraftScript.jar ./src ./data/game/function game 2
echo Zipping...
tar -acf "game.zip" data pack.mcmeta