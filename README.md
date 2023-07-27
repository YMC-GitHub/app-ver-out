# app-ver-out

output some app version.


## Download


```bash
# speed up git clone in china
GC_PROXY="https://ghproxy.com/"
GC_URL="https://github.com/YMC-GitHub/app-ver-out"
GC_URL="${GC_PROXY}${GC_URL}"
git clone -b main "$GC_URL"

# git clone -b v1.0.0 "$GC_URL"
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
./index.sh  ./charts/config.node.base.md
./index.sh  ./charts/config.k8s.mircok8s.md

```


```bash
GC_PROXY="https://ghproxy.com/"
GC_REPO_URL_RAW=https://raw.githubusercontent.com/ymc-github/app-ver-out
url=${GC_PROXY}${GC_REPO_URL_RAW}/main/index.sh
echo $url
# curl -sfL $url | sh
```

## Author

name|email|desciption
:--|:--|:--
yemiancheng|<ymc.github@gmail.com>||

## License
MIT