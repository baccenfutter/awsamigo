# AWS AMIgo

Python package for quick and easy lookup of AWS AMI images.

## Installation

```bash
# For users:
pip install awsamigo


# For developers:
mkvirtualenv awsamigo  # perhaps: `apt install virtualenvwrapper`, first
git clone https://github.com/baccenfutter/awsamigo
cd awsamigo
setvirtualenvproject
make install
```

## Usage

```
awsamigo - Quickly find the right AWS AMI ID for your instances.

Usage:
    awsamigo (-h | --help)
    awsamigo --version
    awsamigo search <distro> [--region=<region>]
                             [--image-name=<name>]
                             [--arch=<arch>]
                             [--image-type=<image_type>]
                             [--hypervisor=<hypervisor>]
                             [--virt-type=<virt_type>]
                             [--device-type=<device_type>]
                             [--state=<state>]
                             [--description=<description>]
    awsamigo latest <distro> [--region=<region>]
                             [--only-id | --only=<only_attr>]
                             [--image-name=<name>]
                             [--arch=<arch>]
                             [--image-type=<image_type>]
                             [--hypervisor=<hypervisor>]
                             [--virt-type=<virt_type>]
                             [--device-type=<device_type>]
                             [--state=<state>]
                             [--description=<description>]

Options:
    -h --help                   Show this help and exit
    --version                   Print version and exit
    --region=<region>           AWS region to connect to [default: eu-west-1]
    --image-name=<name>         Only lookup image-names matchin this pattern
    --arch=<arch>               Display only images of this architecture [default: x86_64]
    --hypervisor=<hypervisor>   Display only images of this hypervisor [default: xen]
    --virt-type=<virt_type>     Display only images of this virtualization-type [default: hvm]
    --device-type=<device_type> Display only images with this root-device type [default: ebs]
    --image-type=<image_type>   Display only images of this machine-type [default: machine]
    --state=<state>             Display only images in this state [default: available]
    --description=<description> Display only images with this description
    --only-id                   Display only the image-id
    --only=<only>               Display only the given attribute of the found image(s)
```

### Example

Search for all officially supported Ubuntu Xenial AMI images:

```
$ awsamigo search ubuntu --image-name ubuntu/images/*16.04*
{
    "Images": [
        {
            "Architecture": "x86_64", 
            "BlockDeviceMappings": [
                {
                    "DeviceName": "/dev/sda1", 
                    "Ebs": {
                        "DeleteOnTermination": true, 
                        "Encrypted": false, 
                        "SnapshotId": "snap-0e0c726d05e3231cc", 
                        "VolumeSize": 8, 
                        "VolumeType": "gp2"
                    }
                }, 
                {
                    "DeviceName": "/dev/sdb", 
                    "VirtualName": "ephemeral0"
                }, 
                {
                    "DeviceName": "/dev/sdc", 
                    "VirtualName": "ephemeral1"
                }
            ], 
            "CreationDate": "2018-03-01T14:32:17.000Z", 
            "Description": "Canonical, Ubuntu, 16.04 LTS, amd64 xenial image build on 2018-02-28", 
            "EnaSupport": true, 
            "Hypervisor": "xen", 
            "ImageId": "ami-0b541372", 
            "ImageLocation": "099720109477/ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-20180228.1", 
            "ImageType": "machine", 
            "Name": "ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-20180228.1", 
            "OwnerId": "099720109477", 
            "Public": true, 
            "RootDeviceName": "/dev/sda1", 
            "RootDeviceType": "ebs", 
            "SriovNetSupport": "simple", 
            "State": "available", 
            "VirtualizationType": "hvm"
        },
        [...]
```

Get only the `ImageId` of the latest Debian Stretch:

```bash
$ awsamigo latest debian --image-name=debian-stretch* --only-id
ami-34414d4d
``