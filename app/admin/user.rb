ActiveAdmin.register User do
	permit_params :email, :moderator
end
