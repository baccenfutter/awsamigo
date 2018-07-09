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
$ export AWS_ACCESS_KEY_ID=
$ export AWS_SECRET_ACCESS_KEY=
$ awsamigo - Quickly find the right AWS AMI ID for your instances.

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

## Examples

Search for all officially supported Ubuntu Xenial AMI images:

```
$ awsamigo search ubuntu --image-name ubuntu/images/*16.04*
{
    "Images": [
        [...]
```

Get only the `ImageId` of the latest Debian Stretch in us-west-1:

```bash
$ awsamigo latest debian --region=us-west-1 --image-name=debian-stretch* --only-id
ami-a126c2c2
``