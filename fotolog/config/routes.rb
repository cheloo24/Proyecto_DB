Rails.application.routes.draw do
	get 'admin/loginadmin'
	get 'admin/prueba'
	get 'usuario/registro'
	get 'usuario/perfil'
	get 'usuario/loginuser'
	root 'controlador#index'
end
