_SO_Examenes/
ll
cd 202406/
ll
cd ansible/
ll
cd roles/
ll
cd 2do_parcial/
ll
cd tasks/
ll

sudo vim main.yml
- name: "Crear directorios en /tmp/2doparcial/"
file:
    path: "/tmp/2doparcial/{{ item }}"
        state: directory
	    mode: '0775'
	        recurse: yes
		  with_items: 
		      - "alumno"
		          - "equipo"
			  :wq

			  sudo mkdir templates
			  cd templates/
			  sudo vim template1.j2
			  Nombre:LeandroSalas
			  Division:116

			  sudo vim template2.j2
			  Nombre Distribucion= {{ ansible_facts.distribution }}
			  IP: {{ ansible_default_ipv4.address }}

			  cd UTN-FRA_SO_Examenes/
			  ll
			  cd 202406/
			  ll
			  cd ansible/
			  ll
			  cd roles/
			  ll
			  cd 2do_parcial/
			  ll
			  cd tasks/
			  ll

			  sudo vim main.yml
			  - name: "Agrego archivo desde templates"
			    template:
			        src: template1.j2
				    dest: /tmp/2do_parcial/alumno/datos_alumno.txt
				      template:
				          src: template2.j2
					      dest: /tmp/2do_parcial/equipo/datos_equipo.txt 

					      - name: "meto NOPASSWD en sudoers para el grupo 2PSupervisores"
					        become: yes
						  lineinfile:
						      path: /etc/sudoers.d/desa
						          state: present
							      line: '%2PSupervisores ALL=(ALL) NOPASSWD: ALL'
							          validate: 'visudo -cf %s'

								  ansible-playbook -i inventory/hosts playbook.yml

