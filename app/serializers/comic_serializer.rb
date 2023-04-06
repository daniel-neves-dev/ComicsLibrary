class ComicSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :synopsis
end
