Rails.application.routes.draw do

  get("/", { :controller => "application", :action => "allUsers" })
  get("/users", { :controller => "application", :action => "allUsers" })
  get("/photos", { :controller => "application", :action => "allPhotos" })
  get("/users/:userName", { :controller => "application", :action => "specificUser" })
  get("/photos/:photoID", { :controller => "application", :action => "specificPhoto" })

  get("delete_photo/:photoID", { :controller => "application", :action => "deletePhoto" })
  get("/add_comment/:photoID", { :controller => "application", :action => "addComment" })
  get("/update_user/:userID", { :controller => "application", :action => "updateUser" })
  get("/insert_user_record", { :controller => "application", :action => "insertUser" })
  get("/insert_photo_record", { :controller => "application", :action => "insertPhoto" })

end
