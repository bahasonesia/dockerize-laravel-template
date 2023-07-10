## Step 1 ##
Clone repo
```
Git clone git@github.com:bahasonesia/dockerize-laravel-template.git
```

## Step 2 ##
Pindahkan semua file ke direktori app yang akan di dockerize
```
Cd dockerize-laravel-template
Mv -R * /var/www/learning-bo.bahaso.com
Cd /var/www/learning-bo.bahaso.com
```

## Step 3 ##
Edit docker-compose, sesuaikan versi redis, database, dan npm yang akan digunakan(Jika tidak menggunakan, comment saja service tersebut)

![image](https://github.com/bahasonesia/dockerize-laravel-template/assets/67664879/d9d79ff5-c3aa-4a0e-9ce5-a37de128ab6f)



## Step 4 ##
Pastikan port yang akan digunakan di service nginx tidak konflik dengan service yang sudah ada. Jika menjalankan lebih dari 2 app Laravel bersamaan, pastikan port yang digunakan untuk docker berbeda
 
![image](https://github.com/bahasonesia/dockerize-laravel-template/assets/67664879/fa7c9cbf-e9ab-4b6e-8cc6-a161b1ef2ec0)

Contoh dalam konfigurasi berikut, aplikasi akan berjalan di server pada port 5050 

## Step 5 ##
Build image dengan command berikut
```
Docker compose up -d –build
```

## Step 6 ##
Pastikan container sudah berjalan dengan command berikut (yang dipastikan harus berjalan adalah service app dan nginx)
```
docker compose ps
```

![image](https://github.com/bahasonesia/dockerize-laravel-template/assets/67664879/554a2751-4d76-496e-bae4-71f0601905ee)


## Step 7 ##
Untuk menjalankan command didalam container, cukup ketik seperti berikut
```
docker compose run app composer install
```

![image](https://github.com/bahasonesia/dockerize-laravel-template/assets/67664879/2a4c6c6d-dcc8-4b92-b6bf-630625dd5401) 

Khusus untuk npm, tidak perlu menuliskan app. 
```
docker compose run npm install
 ```

![image](https://github.com/bahasonesia/dockerize-laravel-template/assets/67664879/bc6393ba-e830-416a-a0c7-9cad417d7033)

## Step 8 ##
Untuk menambahkan cronjob, supervisor, ataupun job yang perlu dijalankan setiap waktu tertentu, sama seperti biasanya hanya saja sebelum command yang akan dijalankan, tambahkan docker compose run app . Contoh untuk cron, tambahkan docker compose run app seperti berikut
```
* * * * * cd /var/www/app/docker-devubbo.bahaso.com/ && docker compose run app php artisan schedule:run >> /dev/null 2>&1
 ```
![image](https://github.com/bahasonesia/dockerize-laravel-template/assets/67664879/2902fc6b-3f98-401f-ae0a-b064bc5c0fe2)


## Step 9 ##
Untuk mematikan atau menghentikan, gunakan command berikut
```
Docker compose down
```

## Step 10 ##
Jika ingin menghidupkan Kembali
```
Docker compose up -d
```
Argument `--build` tidak diperlukan kecuali ada perubahan di file konfigurasi yang ada di folder dockerfiles
