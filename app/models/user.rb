class User < ActiveRecord::Base



  attr_accessor :password, :password_confirmation, :invitation_token

  before_save :encrypt_password

  validates :password, confirmation: true, format: { with: /\A[a-z|A-Z|0-9|-]{6,20}\z/x, message:'Contraseña no valida' }
  validates :password_confirmation, presence: true
  validates :name, format: { with: /\A[a-zA-Z|á|é|í|ó|ú|ü| |ñ]+\z/, message:'Nombre no valido'}
  validates :last_name, format: { with: /\A[a-zA-Z|á|é|í|ó|ú|ü| |ñ]+\z/, message:'Apellido paterno no valido'}
  validates :second_last_name, format: { with: /\A[a-zA-Z|á|é|í|ó|ú|ü| |ñ]+\z/, message:'Apellido materno no valido'}
  validates :email, uniqueness: { message: 'Ese e-mail ya esta siendo utilizado' }, 
            format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,5})\Z/i, message: 'E-mail no valido'}
  validates :nickname, length: { in: 4..15, message: 'Mote fuera de rango' }, uniqueness: { message: 'Ese mote ya esta siendo utilizado'}, 
            format: { with: /\A[a-zA-Z|0-9|-]+\z/, message: 'Mote no valido'}


  
  
  def full_name
    "#{name} #{last_name} #{second_last_name}"
  end
  
  def set_invitation_limit
    self.invitation_limit = 5
  end
  
    def invitation_token
  invitation.token if invitation
end

def invitation_token=(token)
  self.invitation = Invitation.find_by_token(token)
end

  def encrypt_password
    if password == password_confirmation
      if password.present?
        self.password_salt = BCrypt::Engine.generate_salt
        self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
      end
    end
  end

  def self.authenticate(nickname, password)
    user = User.find_by_nickname(nickname)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
   def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.customer_first_name = auth.info.name
      user.email = auth.info.email
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
  
  def materias
    cour = Hash.new
    User.find(self.id).school.majors.each do |carrera| 
      cour = Major.find(carrera.id).courses.each
    end
    return cour
  end

  def profesores
    pro = Hash.new
    User.find(self.id).school.majors.each do |carrera| 
      Major.find(carrera.id).courses.each do |materia|
        pro = Course.find(materia.id).teachers.each
      end
    end
    return pro
  end

end