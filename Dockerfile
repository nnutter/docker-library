FROM python:2

ENV KRB5CCNAME=/tmp/krb5cc

RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-get update \
    && apt-get install -y \
        krb5-config \
        krb5-user \
        sssd \
        sssd-ad \
        sssd-ad-common \
        sssd-common \
        sssd-ipa \
        sssd-krb5 \
        sssd-krb5-common \
        sssd-ldap \
        sssd-proxy \
        vim-nox \
    && apt-get clean

COPY requirements.txt /tmp/
RUN pip install --no-cache-dir -r /tmp/requirements.txt

COPY ssh_config /etc/ssh/
RUN mkdir /etc/ansible
COPY ansible.cfg /etc/ansible/

COPY USAGE.md /var/cache/
CMD ["/bin/cat", "/var/cache/USAGE.md"]

WORKDIR /ansible
