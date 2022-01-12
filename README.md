# tejun

## 実行方法
nginxの起動
```
$ cd path/to/tejun
$ docker run --name nginx --rm -p 8080:80 -v $PWD:/usr/share/nginx/html:ro nginx
```

アクセス
[local site](http://localhost:8080/tejun.html)

## サンプルサイト
[kumauta.com](https://kumauta.com/tejun.html)
