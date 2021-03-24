{frontmatter}

{id: ch00}
# Preface

<!--
 Mike
 (3 pgs)
 
 TK -- needs some of Ronnie's magic here.
 
-->

Welcome to the world of EVENTful services and APIs.

In our recent consulting experience, we've seen a steady increase in the use of event-driven architecture (EDA) in companies of all sizes. In particular we've noticed that organizations that already have a well-establised software engineering culture tend to struggle when introducing EDA to their developer community. It was our collaboration with these kinds of companies that encouraged us to put together this small book on how to successfully move from a primarily RESTful style to a style that includes more event-driven (what we are calling EVENTful) implementatations.

## Who Should Read This Book?
This book is aimed at giving experienced software architects and senior developers a quick overview of the differences and challenges you're likely to encounter as you increase your use of EDA solutions. However, we've structured the book to make it valuable to decision-makers throughout organizations of any size. 

We worked to keep this book small and easy to read so, no matter your role or position in your organization, we hope you'll read this from cover to cover. However, in case you're really pressed for time and/or you just want to get to the parts that would be interesting to _you_, here are our pointers for getting the most out of text quickly.

### Overview for Decision-Makers
If your goal is to get "the lay of the land" for event-driven architecture and a quick overview of the opportunities and challenges companies face as they dive into the event-driven pool, you can focus on reading chapters [one](#ch01) and [six](#ch06).

### Crash Course for Architects and Team Leads
If you will be responsible for supervising the introduction of EDA and setting design and implementation policies, we recommmend you focus on chapter [two](#ch02) & [three](#ch03).

### Examples for Developers and Designers
For those changed with the actual design and programming of EDA-based solutions, chapters [four](#ch04) and [five](#ch05) will probably be most helpful.

No matter your role in the company, you can get a lot from the book relatively quickly by reading the Highlights section at the start of each chapter. Also, every section ends with a short summary and some suggested additional reading to get a more in-depth look at the chapter topics.

## What's Covered?
Using our experience as a guide, we've laid the book out into three general topics that cover the "Why", "What", and "How" of EVENTful services. 

 * In chapter one, ["Why EVENTful?"](#ch01), we take a look at both the market and technical changes of the last few years to see how they have made event-driven architecture (EDA) both more feasiable and more profitable.
 * In chapter two,  ["EVENTful Architecture"](#ch02), we dive into the different _styles_ of EDA and how adopting an EDA model provides the opportunity to change your company's technical infrastructure as well as your IT staff's mindset.
 * In chapter three, ["What You Need to Know"](#ch03), we break down the key elements of an EDA-style solution including addressing key challenges such as coupling between parts of the system, and dealing with both distance and latency in your design.
 * Chapter four, ["Designing EVENTful Systems"](#ch04), and chapter five, ["Customer Onboarding Example"](#ch05), walk the reader through the hands-on process of designing and implementing a sample EDA solution. 
 * Finally, chapter six ["Parting Thoughts"](#ch06), offers some general advice and cautionary tales that will be handy as you set out on your company's EDA journey.
  
## What's Not Covered?
Because we worked to keep the book small, we left out lots of details. For example, we cover key elements of a successful EDA-style arhcitecture (in [chapter two](#ch02) but we don't go into much depth on how to acquire or build each of those elements. We point out challenges like loose coupling, stable message design, and distance and latency in [chapter three](#ch03) but we only touch on the processes and practices you need to put in place to meet those challenges. Even our example solution (chapters [four](#ch04) and [five](#ch05)) are purposely kept light and simplistic in order to focus on main points rather than explore the inevitable subtleties of EDA implemenation.

Instead, we lean heavily on the wisdom and experience of others in our "Additional Reading" sections at the of each chapter. Our plan here is to clue you in to important patterns, practices. and patfalls and then point out some valuable reference and teaching materials to help you craft your own local solutions within your organization.

There are lots of good books on the specifics of designing, building, releasing, and maintaining EDA solutions. This book is meant to get you started and point you in the right direction.

## Acknowledgements
TK
