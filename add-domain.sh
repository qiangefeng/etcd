function addDomain()
{
    ip=$1
    domain=$2
    subDomain=""

    for i in $(echo $domain | sed 's/\./ /g')
    do
            subDomain=/$i$subDomain
    done

    key=/public$subDomain
    docker exec etcd /bin/sh -c "etcdctl put $key '{\"host\":\"$ip\"}'"
}

while read line
do 
    ip=$(echo $line | awk '{print $1}')
    domain=$(echo $line | awk '{print $2}')
    addDomain $ip $domain
done < hosts

#hosts file like /etc/hosts:
#192.168.1.1 mydomain.com
