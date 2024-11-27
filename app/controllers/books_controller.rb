class BooksController < ApplicationController


  private

  def getISBN(genre, year, page)
    client = OpenAI::Client.new
    chatgpt_response = client.chat(parameters: {
      model: "gpt-4o-mini",
      messages: [{ role: "user", content: "Please, give me ONLY an array containing ISBN-13 of 10 books available on the ISBN DB that match the following:
      #{genre}
      #{page}
      Famous personalities
      released around #{year}
      novel

      Do not return anything else than the array. List from the most relevant to the least relevant. Also add a reason (from 200 to 400 characters) about why this suggestion was given.

      Return it in an array of ruby hashes (Keys ISBN and Reason).
      " }]
      })
    return chatgpt_response["choices"][0]["message"]["content"]
  end
end
