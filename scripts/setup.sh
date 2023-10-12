#https://github.com/snowdence/tekcore-frp/releases/download/beta/frp_0.51.4_linux_amd64.tar.gz
wget -qO- https://github.com/snowdence/tekcore-frp/releases/download/beta/frp_0.51.4_linux_amd64.tar.gz | tar xvz


echo "Master name $1 (1) : $@"

MASTER_NAME=$1

USAGE=$(cat <<-END
[common]
server_addr = t.wifosoft.com
#server_addr = frp.tekcore.win
server_port = 7000

[ssh]
type = tcp
local_ip = 127.0.0.1
local_port = 22
remote_port = 6000


[${MASTER_NAME}-master]
type = http
subdomain = ${MASTER_NAME}-8001
local_port = 8001

[${MASTER_NAME}-acb-6554]
type = http
subdomain = ${MASTER_NAME}-acb-6554
local_port = 6554

[${MASTER_NAME}-acb-6556]
type = http
subdomain = ${MASTER_NAME}-acb-6556
local_port = 6556
END
)

echo $USAGE

echo "$USAGE" > ./frp_0.51.4_linux_amd64/frpc.ini