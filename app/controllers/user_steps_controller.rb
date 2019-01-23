class UserStepsController < ApplicationController
  include Wicked::Wizard
  steps :phone_number_registration, :address_registration, :completion

  def show
    @user = User.last
    render_wizard
  end

  def update
    @user = User.last
    @user.update!(user_params)
    render_wizard @user
  end

  private

  def finish_wizard_path
    root_path
  end

  def user_params
    params.require(:user).permit(:name,:last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :prefecture, :city, :block, :building, :phone_number)
  end
end
