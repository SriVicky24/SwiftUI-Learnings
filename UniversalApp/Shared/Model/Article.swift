//
//  Article.swift
//  UniversalApp
//
//  Created by Sri Vignesh on 4/9/20.
//

import Foundation

enum ArticleType: Int {
  case article
  case slide
  case gif
  case audio
  case video
  
  func description() -> String {
    switch self {
      case .article:
        return "Article"
      case .slide:
        return "Slide"
      case .gif:
        return "Gif"
      case .audio:
        return "Audio"
      case .video:
        return "Video"
    }
  }
}

struct Article: Identifiable {
  let id = UUID()
  let name: String
  let authorName: String
  let date: String
  let like: Int
  let shares: Int
  let imageName: String
  let type: ArticleType
  let content: String?
}

var articles : [Article] = [
  
  Article(name: "A World of Good to Do",
          authorName: "Marvin Olasky",
          date: "Aug 21, 2020",
          like: 254,
          shares: 87,
          imageName: "Article1",
          type: .article,
          content: "When I taught classes on journalism and religion at The University of Texas, I asked my students on the first day to characterize “Christian” in one or two words. The most frequent answer: antigay. Clearly, Christian repugnance over the public celebration of sin outweighed, at least in these students’ minds, Christian contributions to the welfare of the cities where we live in exile, building houses and planting gardens (Jeremiah 29:5, 7)."),
  Article(name: "Is It Against the Law to Love Illegals?",
          authorName: "Vance Whitaker",
          date: "Mar 27, 2020",
          like: 124,
          shares: 32,
          imageName: "Article2",
          type: .article,
          content: "With a sickening crunch, the truck plowed into our front left fender. After a few moments of stunned confusion, we were thankful to find that no one was hurt. The same could not be said for our family station wagon. The Hispanic man who had run into us apologized in broken English, and presented us with his insurance card. The police declined to assign fault. Later we would discover that the man had bought the insurance in Mexico and then canceled it shortly after crossing the border."),
  Article(name: "Only Christians Understand True Social Justice",
          authorName: "Bryce",
          date: "Jul 5, 2020",
          like: 54,
          shares: 10,
          imageName: "Article3",
          type: .article,
          content: "I live in a fairly progressive city. “Social justice” is precious cultural currency. Where you fall on any number of social issues can brand you a hero, a warrior, a victim, or a villain. And this isn’t the case only in my city. Our culture as a whole is knee-deep in the mud pit fighting over the greased pig of “Justice”: racial discrimination, abortion, welfare, healthcare, the environment, immigration, the definition of marriage, foreign policy, poverty rates, economic issues — what are your thoughts on . . . all of them? Where do you fall? Facebook feeds and Twitter streams have become a social war zone with articles, op-eds, think pieces, and news updates as the ammunition fired between various ideologies. We love the idea of social justice, of being on “the right side of history.” For every race, class, political affiliation, religion, for both men and women, the question is: “Whose ‘justice’ is right?”"),
  
  Article(name:"The New Eugenics",
          authorName:"Andrew Shanks",
          date: "Jun 19, 2020",
          like: 764,
          shares: 123,
          imageName: "Article4",
          type: .article,
          content: "Eugenics had its heyday in the early part of the twentieth century. Eugenics theory taught that selective breeding among humans would eventually eradicate undesirable physical traits. Individuals and groups who possessed undesirable traits were to be forcibly sterilized to prevent their reproduction. The theory of eugenics (literally, “good genes”) enjoyed wide popularity in its beginning. That is, until it was adopted as a major facet of the Nazi program in Germany. The Nazis perfected the more brutal methods of eugenic theory, and the result was the attempted extermination of Jews, Gypsies, homosexuals, and other unwanted groups. Since then, eugenics has fallen into predictable disrepute. Recently, however, new developments in genetic science have resurrected some of the goals of the old eugenics projects."),
  Article(name: "Five Ways We Fight for Children",
          authorName: "Phillip Holmes",
          date: "Aug 21, 2020",
          like: 234,
          shares: 76,
          imageName: "Article5",
          type: .article,
          content: "Recent trends in the direction of the full-scale legalization of marijuana suggest that pot is undergoing a dramatic marketing makeover. One cannabis branding firm put it this way: “There is a huge untapped market here. It’s about reaching nonconsumers: women, young people, business professionals, grandmothers and soccer moms.” Get ready: if it hasn’t already, your favorite show will probably feature marijuana in a way that makes it feel cool — whether in a joint, a pot-tart, a keefcat, or a pot-brownie. This means that Christians will need to think more carefully about marijuana than most of us have until now."),
  Article(name: "Five Questions to Ask Before You Consume Cannabis",
          authorName: "Trent Hunter",
          date: "Apr 15, 2020",
          like: 45,
          shares: 7,
          imageName: "Article6",
          type: .article,
          content: "Less than a week ago, a video was released that provided damning evidence that Planned Parenthood was selling the body parts of infant corpses. Christians immediately took to social media calling Planned Parenthood actions “inhumane” and “barbaric.” Many demanded that the government defund the organization and others insisted that they be shut down. Christians should continue to leverage their influence online to expose the atrocities taking place inside an organization that makes profit by murdering innocents and traffics their body parts under the guise of women’s rights. But that’s not all we should do. It’s one thing to protest external problems like Planned Parenthood for what it truly is — a baby-murdering machine."),
  Article(name: "Too Scared to Cry: Social Media Outrage and the Gospel",
          authorName: "Russell Moore",
          date: "May 28, 2020",
          like: 545,
          shares: 162,
          imageName: "Article7",
          type: .article,
          content: "A friend of mine posted on Facebook about what he called a “parenting fail.” His son stubbed his toe, and squealed with tears. My friend wanted to toughen him up, and told him that only girls cried like that, not boys. Later that day, this dad and his son were talking about another playground injury, and his son told him how he avoided crying. He said he held off tears by getting very angry and blaming the person standing closest to him. \n “Nice work dad,” my friend wrote to himself, cringing at the unintended result. At first glance, I identified with the story. I think all of us as parents wince when we think of how clumsy our parenting can be at times. But, beyond that, I thought this experience explained something we see all around us, including often in the church, a temptation I fight in myself almost daily.")
]
