Article.destroy_all
Comment.destroy_all

@a1 = Article.create!(title: "Oh Hello", body: "How're you doing today, dear reader?")
@a2 = Article.create!(title: "A Day In The Life", body: "Walk the puppy. Play with the puppy. Feed the puppy. What a life.")

@c1 = @a1.comments.create!(author_name: "it me", body: "interesting")
@c2 = @a1.comments.create!(author_name: "it also me", body: "sugoi")
@c3 = @a2.comments.create!(author_name: "it not me", body: "neat")
@c4 = @a2.comments.create!(author_name: "jk it me", body: "kuru")