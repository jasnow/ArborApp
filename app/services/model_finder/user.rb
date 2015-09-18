module ModelFinder
  class User < Finder
    def find_or_initialize
      ::User.find_or_initialize_by(
        email: info['email']
      ).tap do |user|
        update(user)
      end
    end
  end
end
