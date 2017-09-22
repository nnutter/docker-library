FROM python:2-onbuild

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
    && apt-get clean
