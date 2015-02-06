echo "Choose flavor from below list";
nova flavor-list | awk {print'$4'} ;
read flv;

echo "Choose Image from below list to use Create VM";
nova image-list | awk {print'$4'} ;
read img;

echo "Choose security group from below list";
nova secgroup-list | awk {print'$4'};
read seclist;

echo "Choose key-pair from below list";
nova keypair-list | awk {print'$2'};
read kplist;


echo "Give name to the server ";
read name;

echo "How many servers you want to spawn"
read num;

nova boot --flavor $flv --image $img --security-group $seclist --key-name $kplist --max-count $num $name;
