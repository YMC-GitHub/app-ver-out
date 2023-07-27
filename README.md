# app-ver-out

output some app version.


## Download


```bash
# speed up git clone in china
GC_PROXY="https://ghproxy.com/"
GC_URL="https://github.com/YMC-GitHub/app-ver-out"
GC_URL="${GC_PROXY}${GC_URL}"
git clone -b main "$GC_URL"
```


## Usage

`./config.sample.md`
```bash
# cat ./charts/config.sample.md
git --version,zero_app_ver_reg_3,git
node --version,zero_app_ver_reg_3,node
npm --version,zero_app_ver_reg_3,npm
pnpm --version,zero_app_ver_reg_3,pnpm
nrm --version,zero_app_ver_reg_3,nrm
docker -v,zero_app_ver_reg_3,docker
```

```bash
./index.sh ./charts/config.sample.md
```


## Author

name|email|desciption
:--|:--|:--
yemiancheng|<ymc.github@gmail.com>||

## License
MIT