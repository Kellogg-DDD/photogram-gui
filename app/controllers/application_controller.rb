class ApplicationController < ActionController::Base

  def allUsers 
    @all_users = User.all

    render({ :template => "layouts/allUsers.html.erb" })
  end

  def allPhotos
    @all_photos = Photo.all

    render({ :template => "layouts/allPhotos.html.erb" })
  end

  def specificUser
    userName = params.fetch("userName")
    @user = User.where({ :username => userName }).first 
    @photos = Photo.where({ :owner_id => @user.id })

    render({ :template => "layouts/user.html.erb" })
  end

  def specificPhoto
    photoID = params.fetch("photoID")
    @photo = Photo.where({ :id => photoID }).first 
    @comments = Comment.where({ :photo_id => photoID })

    render({ :template => "layouts/photo.html.erb" })
  end

  def deletePhoto
    photoID = params.fetch("photoID")
    Photo.destroy(photoID)

    redirect_to "/photos"
  end

  def addComment
    photoID = params.fetch("photoID").to_i
    comment = params.fetch("input_comment").to_s
    author = params.fetch("input_author_id").to_i

    commentNew = Comment.new 
    commentNew.photo_id = photoID
    commentNew.body = comment
    commentNew.author_id = author
    commentNew.save

    redirect_to "/photos/" + photoID.to_s
  end

  def updateUser
    userID = params.fetch("userID")
    newUsername = params.fetch("input_username")
    user = User.where({ :id => userID }).first
    user.username = newUsername
    user.save

    redirect_to "/users/" + userID.to_s
  end

  def insertUser
    userName = params.fetch("input_username")

    u = User.new 
    u.username = userName
    u.save

    newU = User.where({ :username => userName }).first

    redirect_to "/users/" + newU.username.to_s
  end

  def insertPhoto
    photo = params.fetch("input_image")
    caption = params.fetch("input_caption")
    user = params.fetch("input_user_id")

    p = Photo.new 
    p.image = photo
    p.owner_id = user
    p.caption = caption
    p.save

    newP = Photo.where({ :image => photo }).where({ :caption =>  caption }).first

    redirect_to "/photos/" + newP.id.to_s
  end
end
