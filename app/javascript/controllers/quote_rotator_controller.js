import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["quote"];

    connect() {
      // List of quotes
      this.quotes = [
        "It is a truth universally acknowledged, that a single man in possession of a good fortune, must be in want of a wife. - Jane Austen (Pride and Prejudice)",
        "Call me Ishmael. - Herman Melville (Moby-Dick)",
        "It was the best of times, it was the worst of times. - Charles Dickens (A Tale of Two Cities)",
        "All animals are equal, but some animals are more equal than others. - George Orwell (Animal Farm)",
        "To be, or not to be, that is the question. - William Shakespeare (Hamlet)",
        "I am no bird; and no net ensnares me: I am a free human being with an independent will. - Charlotte Brontë (Jane Eyre)",
        "So we beat on, boats against the current, borne back ceaselessly into the past. - F. Scott Fitzgerald (The Great Gatsby)",
        "I don’t know what’s worse: to not know what you are and be happy, or to become what you’ve always wanted to be, and feel alone. - Daniel Keyes (Flowers for Algernon)",
        "It does not do to dwell on dreams and forget to live. - J.K. Rowling (Harry Potter and the Philosopher's Stone)",
        "Even the smallest person can change the course of the future. - J.R.R. Tolkien (The Lord of the Rings: The Fellowship of the Ring)",
        "The only thing that you absolutely have to know, is the location of the library. - Albert Einstein",
        "There is no friend as loyal as a book. - Ernest Hemingway",
        "I am afraid. Not of life, or death, or nothingness, but of wasting it as if I had never been. - Daniel Keyes (Flowers for Algernon)",
        "The more that you read, the more things you will know. The more that you learn, the more places you’ll go. - Dr. Seuss (I Can Read With My Eyes Shut!)",
        "The man who does not read has no advantage over the man who cannot read. - Mark Twain",
        "You can never get a cup of tea large enough or a book long enough to suit me. - C.S. Lewis",
        "A room without books is like a body without a soul. - Cicero",
        "Books are a uniquely portable magic. - Stephen King (On Writing: A Memoir of the Craft)",
        "Reading is essential for those who seek to rise above the ordinary. - Jim Rohn",
        "Even in the world of make-believe, there have to be rules. The parts have to be consistent and belong together. - Daniel Keyes (Flowers for Algernon)",
        "Now I understand that one of the important reasons for going to college and getting an education is to learn that the things you've believed in all your life aren't true, and that nothing is what it appears to be. - Daniel Keyes (Flowers for Algernon)",
        "Unlike stories, real life, when it has passed, inclines toward obscurity, not clarity. - Elena Ferrante (The Story of the Lost Child)",
        "I cannot live without books. - Thomas Jefferson",
        "Books are a uniquely portable magic. - Stephen King (On Writing: A Memoir of the Craft)",
        "What is this life if, full of care, we have no time to stand and stare? - W.H. Davies",
        "It is the possibility of having a dream come true that makes life interesting. - Paulo Coelho (The Alchemist)",
        "Perhaps it is our imperfections that make us perfect for one another. - Colleen Hoover (It Ends With Us)",
        "Life is what happens when you're busy making other plans. - John Lennon (A Long and Winding Road)",
        "I am not a bird; and no net ensnares me: I am a free human being with an independent will. - Charlotte Brontë (Jane Eyre)",
        "When you think of love, think of how it feels to be in the arms of someone you care about. - Colleen Hoover (Verity)",
        "There is nothing more important than a good, safe, secure home. - Rosalyn Carter",
        "Reading is to the mind what exercise is to the body. - Joseph Addison",
        "When we are no longer able to change a situation, we are challenged to change ourselves. - Viktor Frankl (Man's Search for Meaning)",
        "Sometimes you have to be a little bit crazy to make a great story. - Brian Jacques (Redwall)",
        "A person who won’t read has no advantage over one who can’t read. - Mark Twain",
        "It’s not what’s on the outside that matters, it’s what’s inside. - The Brothers Grimm (Fairy Tales)",
        "We live in capitalism. Its power seems inescapable. So did the divine right of kings. - Ursula K. Le Guin (The Dispossessed)",
        "The best way to predict the future is to create it. - Abraham Lincoln",
        "Our lives are defined by opportunities, even the ones we miss. - F. Scott Fitzgerald (The Great Gatsby)",
        "We don't have to be perfect to be wonderful. - Alice Walker (The Color Purple)",
        "There’s no friend like a book. - A.A. Milne (Winnie the Pooh)",
        "It’s never too late to be what you might have been. - George Eliot",
        "I wish I could show you, when you are lonely or in darkness, the astonishing light of your own being. - Gabriel García Márquez (Love in the Time of Cholera)",
        "What matters in life is not what happens to you but what you remember and how you remember it. - Gabriel García Márquez (Living to Tell the Tale)",
        "The world was so recent that many things lacked names, and in order to avoid speaking of them it was necessary to point. - Gabriel García Márquez (One Hundred Years of Solitude)",
        "Inside us there is something that has no name, that something is what we are. - José Saramago (Blindness)",
        "The world is indeed full of peril, and in it there are many dark places. But still there is much that is fair, and though in all lands love is now mingled with grief, it grows perhaps the greater. - J.R.R. Tolkien (The Lord of the Rings: The Fellowship of the Ring)"
      ];

      this.displayRandomQuote(); // Display a random quote when the page loads
    }

    // Method to display a random quote
    displayRandomQuote() {
      const randomIndex = Math.floor(Math.random() * this.quotes.length);
      this.quoteTarget.textContent = this.quotes[randomIndex]; // Set the selected quote
    }
  }
