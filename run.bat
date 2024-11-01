@echo off
title Notpixel by @thic_autu
chcp 65001 >nul
if not exist .venv (
    echo Đang tạo biến môi trường...
    python -m venv .venv
)

echo Activating biến môi trường...
call .venv\Scripts\activate

if not exist .venv\Lib\site-packages\installed (
    if exist requirements.txt (
        echo Đang cài đặt wheel để cài đặt nhanh hơn
        pip install wheel
        echo Đang cài đặt các dependencies...
        pip install -r requirements.txt
        echo. > .venv\Lib\site-packages\installed
    ) else (
        echo requirements.txt không tồn tại, bỏ qua việc cài đặt dependencies.
    )
) else (
        echo Dependencies đã được cài đặt, bỏ qua việc cài đặt.
    )

if not exist .env (
    echo Đang copy file cấu hình
    copy .env-example .env
) else (
        echo Đã copy file cấu hình, bỏ qua việc copy.
    )

if not exist data.txt (
    echo Đang copy file data.txt
    copy data-example.txt data.txt
)

if not exist proxy.txt (
    echo Đang copy file proxy.txt
    copy proxy-example.txt proxy.txt
)

if not exist reflink\reflink_10.txt (
    echo Đang copy file reflink_10.txt
    copy reflink\reflink_10-example.txt reflink\reflink_10.txt
)

if not exist reflink\reflink_100.txt (
    echo Đang copy file reflink_100.txt
    copy reflink\reflink_100-example.txt reflink\reflink_100.txt
)

if not exist reflink\reflink_1000.txt (
    echo Đang copy file reflink_1000.txt
    copy reflink\reflink_1000-example.txt reflink\reflink_1000.txt
)

:loop
python main.py
echo Đang khởi động lại chương trình sau 30 giây...
timeout /t 30 /nobreak >nul
goto :loop

