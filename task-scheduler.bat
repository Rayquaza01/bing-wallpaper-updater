@echo off
schtasks.exe /Create /SC DAILY /MO 1 /ST 06:00 /TR %cd%\BingWallpaperUpdater.pyw /TN BingWallpaperUpdater
