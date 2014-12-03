class BancoUsuario < ActiveRecord::Migration
   	def self.up
   		create_table :usuarios do |u|
    		u.string 	:nm_usuario
    		u.string 	:nm_endereco
    		u.string 	:nr_cpf
    		u.string 	:nm_sexo
    		u.integer	:nr_telefone
    		u.date 		:dt_data 
    		u.timestamps
  		 end
 	end

	 def self.down
	 	  drop_table :usuarios
	 end
end
