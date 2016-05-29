FROM local/centos-ansible
# local/centos-ansible

ADD . /ansible-script


RUN echo "localhost ansible_connection=local" > /etc/ansible/hosts
    # git clone -b stable-2.1 --depth=1 https://github.com/ansible/ansible-modules-extras.git /ansible-script/ansible-modules-extras

# RUN export ANSIBLE_LIBRARY=$ANSIBLE_LIBRARY:/ansible-script/ansible-modules-extras && \
# RUN ansible-galaxy install geerlingguy.php
RUN ansible-playbook  --become-method=su /ansible-script/site.yml -vv

CMD ansible-playbook -e phase=running --become-method=su /ansible-script/site.yml -vv

    # cd /usr/src && \
    # git clone --depth=1 --branch v2.0.2.0-1 git://github.com/ansible/ansible.git --recursive && \
    # cd ansible && \
    # make rpm && \
    # yum install -y  rpm-build/ansible-2.0.2.0-0.git201604192124.24d9e5e.HEAD.el7.centos.noarch.rpm && \
    # cd .. && rm -R ansible && yum remove -y asciidoc rpm-build python2-devel a2x make && \
