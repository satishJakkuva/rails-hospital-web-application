# Preview all emails at http://localhost:3000/rails/mailers/medicineprescript_mailer
class MedicineprescriptMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/medicineprescript_mailer/send_medicine_prescript
  def send_medicine_prescript
    MedicineprescriptMailer.send_medicine_prescript
  end

end
