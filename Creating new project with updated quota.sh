echo "Give tenant Name to create";
read tntname;

echo "Give any description if required or press enter "
read desc;

keystone tenant-create --name $tntname --description $desc;

echo "Give username to use this tenant";
read uname;

echo "Give password for user $uname ";
read upass;

echo "Give e-mail address for user $uname";
read email;


keystone user-create --name $uname --pass $upass --email $email;

keystone user-role-add --tenant $tntname --user $uname --role _member_;

echo "This is default quota for tenant $tntname ";
nova quota-show --tenant $tntname;

echo "----------------------";

echo "Give quota values to define for tenant";
echo "instances : "
read instances;

nova quota-update --instances $instances $tntname;

echo "cores : "
read cores;

nova quota-update --cores $cores $tntname;

echo "ram :"
read ram;
nova quota-update --ram $ram $tntname;

echo "floating_ips :"
read fltip;
nova quota-update --floating_ips $fltip $tntname;

echo "security_groups :"
read secgrp;
nova quota-update --security_groups $secgrp $tntname;

echo "security_group_rules :"
read secgrprl;
nova quota-update --security_group_rules $secgrprl $tntname;



echo "This is updated quota for tenant $tntname ";

nova quota-show --tenant $tntname;
