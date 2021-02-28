Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  root to: "pictures#index"
  resources :favorites, only: [:create, :destroy, :index]
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :pictures do
    collection do
      post :confirm
    end
  end
end


# class ActionDispatcher
#   def root(params)
#     "pictures#index"
#     pc = PicturesController.new()
#     ar = ActionRender.new()
#     pc.params = params
#     ar.action(pc, "index")
#   end
# end
#
# class ActionRender
#   def action(controller, name)
#     controller[`name`]
#     @instances = controller.instances
#     render(:index, @instances)
#   end
#
#   def render(name, vars = {})
#     to 'index.html.erb', vars
#     delete controller
#   end
# end
#
# C => V @
# V => C params -> url, form
