# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

wayne = Character.create name: "Wayne", slug: "wayne"
daryl = Character.create name: "Daryl", slug: "daryl"
katy = Character.create name: "Katy", slug: "katy"
dan = Character.create name: "Squirrelly Dan", slug: "dan"
jonesy = Character.create name: "Jonesy", slug: "jonesy"
reilly = Character.create name: "Reilly", slug: "reilly"
stewart = Character.create name: "Stewart", slug: "stewart"
gail = Character.create name: "Gail", slug: "gail"
glen = Character.create name: "Glen", slug: "glen"

wayne.quotes.create([
  {text: "It’s like algebra…why you gotta put numbers and letters together? Why can’t you just go fuck yourself?"},
  {text: "You naturally care for a companionship, but I guess there’s a lot worse things than playing a little one man couch hockey in the dark."},
  {text: "Right as Dan's jerk hand."},
  {text: "Pitter patter, let’s get at ‘er."},
  {text: "Well, there’s nothing better than a fart. Except kids falling off bikes, maybe. Fuck, I could watch kids fall off bikes all day, I don’t give a shit about your kids."},
  {text: "Oh, come on, kitten. I won’t tell anyone."},
  {text: "Tim’s, McDonald’s, and the beer store are all closed on Christmas Day. And that’s your whole world right there."},
  {text: "Here’s a poem. Star light, star bright, why the fuck you got earrings on? Bet your lobes ain’t the only thing that got a hole punched in ’em."},
  {text: "I wish you weren’t so fucking awkward, bud."},
  {text: "Does a duck with a boner drag weeds?"},
  {text: "You wish there was a pied piper for possums. But there isn’t, so you’re just gonna have to keep picking ‘em off with a .22."},
  {text: "You seen a ‘coon havin’ sex with a barn cat on top of your truck? Fuck what’s the nature of that David Suzuki."},
  {text: "Not my pig, not my farm."},
  {text: "Oh, get off the cross, we need the wood."},
  {text: "You stopped toe curlin’ in the hot tub ‘cause you heard sperms stay alive in there and you’ve seen Teenage Mutant Ninja Turtles enough times to know how that story ends."},
  {text: "Buddy you couldn’t wheel a fuckin’ tire down a hill."},
  {text: "If you have a problem with the majestic Canadian Goose, then you have a problem with me. And I suggest you let that one marinate."},
  {text: "Seeing as this is most certainly a one-off event and not a tradition that also falls on some made-up holiday that I couldn’t give a cats queef about, I’m out. There’s happiness calling my name from the bottom of a bottle of Puppers."},
  {text: "Well, I’d say give your balls a tug, but it looks like yer pants are doin’ it for ya."},
  {text: "Your dad says guys with big trucks have little dinks. And that makes sense cuz you want a real big truck and got a real little dink."},
  {text: "Figure it out."},
  {text: "As long as everyone's having a good time, there's no need to be a poopy pants."},
  {text: "Hard no."},
  {text: "To be faaaaair!"},
  {text: "You brought a potato gun to a paint ball fight and shit got very real when your dad took one in the pills."},
  {text: "It's like I'm indestructible by both scientific and pop-culture standards"},
  {text: "Real men finish what they started."},
  {text: "It's a hard life pickin stones and pullin teets, but sure as gods got sandals, it sure beats fightin dudes with treasure trails."},
  {text: "Do you guys do CrossFit? You can CrossFuck off!"},
  {text: "What’s up with your fuckin body hair big shoots? You look like a 12-year-old dutch girl."}
])

daryl.quotes.create([
  {text: "You knew your pal had come into money when he started throwing out perfectly good pistachios like he was above cracking ‘em open with a box cutter like the rest of us."},
  {text: "I see the muscle shirt came today. Muscles coming tomorrow? Did ya get a tracking number? Oh I hope he got a tracking number. That package is going to be smaller than the one you’re sportin’ now."},
  {text: "How're we going to fuck this pig?"},
  {text: "Your neighbor put a Corvette engine in a Ford Ranger. Like, what a fuckin' basic."},
  {text: "Closest you’re gettin’ to any action this weekend is givin’ the dairy cow’s teets a good scrubbin’."},
  {text: "Can't help gettin' a semi while bouncing around in a semi truck."}
])

katy.quotes.create([
  {text: "Oh I’m stomping the brakes, put that idea right through the fucking windshield."},
  {text: "Is that what you appreciate about me?"},
  {text: "That was well brought up. Too bad you weren’t."},
  {text: "Can confirm"}
])

jonesy.quotes.create([
  {text: "Fuck, Lemony Snicket, what A Series of Unfortunate Events you been through, you ugly fuck."},
  {text: "Fuck you Shorsey!"}
])

reilly.quotes.create([
  {text: "Fuck you Shoresy! Put a shirt on."},
  {text: "Oh, c’mon, where’s your jam, bud?"}
])

dan.quotes.create([
  {text: "Out of the way I’m growing a tail!"},
  {text: "Youse guys ever take the dirt road home?"},
  {text: "That's what I appreciates about you."}
])

gail.quotes.create([
  {text: "Call me a cake, ‘cause I’ll go straight to your ass, cowboy!"},
  {text: "You wanna 68? That's when you go down on me... And I'll owe ya one"},
  {text: "How many planets are there? Only seven after I destroy Uranus"},
  {text: "I was flicking more bean than a Starbucks barista!"}
])

stewart.quotes.create([
  {text: "Shirt tucker!"},
  {text: "Wonderous!"}
])

glen.quotes.create([
  {text: "I can't remember the last time five men came in this church so aggressively….or can I?"},
  {text: "Two dycks at once? My cup runneth over!"},
  {text: "I wanna be close to Christ... and Wayne"},
  {text: "Who will touch me first? Is it Christ... or Wayne"},
  {text: "That is private, not true, and also a good idea!"}
])
