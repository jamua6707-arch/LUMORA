import '../models/quote.dart';
import '../models/quote_category.dart';

/// Cycles through the N photos bundled for a category so quotes reuse
/// the same small, hand-picked image set rather than needing 1:1 assets.
String _img(QuoteCategory category, int index, {int count = 4}) {
  final n = (index % count) + 1;
  final file = n.toString().padLeft(2, '0');
  return 'assets/images/${category.folder}/${category.folder}_$file.jpg';
}

/// 54 curated quotes spread across the three editorial photography
/// categories. Attributed quotes are widely cited short-form sayings;
/// unattributed lines are original Lumora editorial copy.
final List<Quote> quotes = [
  // --- Nature ---------------------------------------------------------
  Quote(
    id: 'n01',
    text: 'Look deep into nature, and then you will understand everything '
        'better.',
    author: 'Albert Einstein',
    category: QuoteCategory.nature,
    imageAsset: _img(QuoteCategory.nature, 0),
  ),
  Quote(
    id: 'n02',
    text: 'In every walk with nature, one receives far more than he seeks.',
    author: 'John Muir',
    category: QuoteCategory.nature,
    imageAsset: _img(QuoteCategory.nature, 1),
  ),
  Quote(
    id: 'n03',
    text: 'Adopt the pace of nature: her secret is patience.',
    author: 'Ralph Waldo Emerson',
    category: QuoteCategory.nature,
    imageAsset: _img(QuoteCategory.nature, 2),
  ),
  Quote(
    id: 'n04',
    text: 'The earth laughs in flowers.',
    author: 'Ralph Waldo Emerson',
    category: QuoteCategory.nature,
    imageAsset: _img(QuoteCategory.nature, 3),
  ),
  Quote(
    id: 'n05',
    text: 'Nature does not hurry, yet everything is accomplished.',
    author: 'Lao Tzu',
    category: QuoteCategory.nature,
    imageAsset: _img(QuoteCategory.nature, 0),
  ),
  Quote(
    id: 'n06',
    text: 'The quieter you become, the more you are able to hear.',
    author: 'Rumi',
    category: QuoteCategory.nature,
    imageAsset: _img(QuoteCategory.nature, 1),
  ),
  Quote(
    id: 'n07',
    text: 'Study nature, love nature, stay close to nature. It will never '
        'fail you.',
    author: 'Frank Lloyd Wright',
    category: QuoteCategory.nature,
    imageAsset: _img(QuoteCategory.nature, 2),
  ),
  Quote(
    id: 'n08',
    text: 'There is a pleasure in the pathless woods.',
    author: 'Lord Byron',
    category: QuoteCategory.nature,
    imageAsset: _img(QuoteCategory.nature, 3),
  ),
  Quote(
    id: 'n09',
    text: 'Between every two pines is a doorway to a new world.',
    author: 'John Muir',
    category: QuoteCategory.nature,
    imageAsset: _img(QuoteCategory.nature, 0),
  ),
  Quote(
    id: 'n10',
    text: 'A single leaf, falling slowly, teaches more about patience than '
        'a season of striving.',
    author: 'Lumora Journal',
    category: QuoteCategory.nature,
    imageAsset: _img(QuoteCategory.nature, 1),
  ),
  Quote(
    id: 'n11',
    text: 'Let the forest remind you: growth is mostly invisible, and all '
        'the more real for it.',
    author: 'Lumora Journal',
    category: QuoteCategory.nature,
    imageAsset: _img(QuoteCategory.nature, 2),
  ),
  Quote(
    id: 'n12',
    text: 'Keep close to Nature\'s heart, and break clear away, once in '
        'awhile.',
    author: 'John Muir',
    category: QuoteCategory.nature,
    imageAsset: _img(QuoteCategory.nature, 3),
  ),
  Quote(
    id: 'n13',
    text: 'Wherever you go, no matter what the weather, always bring your '
        'own sunshine.',
    author: 'Anthony J. D\'Angelo',
    category: QuoteCategory.nature,
    imageAsset: _img(QuoteCategory.nature, 0),
  ),
  Quote(
    id: 'n14',
    text: 'The moss does not rush to cover the stone. It simply continues.',
    author: 'Lumora Journal',
    category: QuoteCategory.nature,
    imageAsset: _img(QuoteCategory.nature, 1),
  ),
  Quote(
    id: 'n15',
    text: 'In the woods, we return to reason and faith.',
    author: 'Ralph Waldo Emerson',
    category: QuoteCategory.nature,
    imageAsset: _img(QuoteCategory.nature, 2),
  ),
  Quote(
    id: 'n16',
    text: 'Even the oak was once an acorn afraid of the ground.',
    author: 'Lumora Journal',
    category: QuoteCategory.nature,
    imageAsset: _img(QuoteCategory.nature, 3),
  ),
  Quote(
    id: 'n17',
    text: 'Those who contemplate the beauty of the earth find reserves of '
        'strength that will endure as long as life lasts.',
    author: 'Rachel Carson',
    category: QuoteCategory.nature,
    imageAsset: _img(QuoteCategory.nature, 0),
  ),
  Quote(
    id: 'n18',
    text: 'Morning light through leaves asks for nothing and gives '
        'everything.',
    author: 'Lumora Journal',
    category: QuoteCategory.nature,
    imageAsset: _img(QuoteCategory.nature, 1),
  ),

  // --- Landscapes -------------------------------------------------------
  Quote(
    id: 'l01',
    text: 'Not all those who wander are lost.',
    author: 'J.R.R. Tolkien',
    category: QuoteCategory.landscapes,
    imageAsset: _img(QuoteCategory.landscapes, 0),
  ),
  Quote(
    id: 'l02',
    text: 'The journey of a thousand miles begins with a single step.',
    author: 'Lao Tzu',
    category: QuoteCategory.landscapes,
    imageAsset: _img(QuoteCategory.landscapes, 1),
  ),
  Quote(
    id: 'l03',
    text: 'It is good to have an end to journey toward; but it is the '
        'journey that matters, in the end.',
    author: 'Ursula K. Le Guin',
    category: QuoteCategory.landscapes,
    imageAsset: _img(QuoteCategory.landscapes, 2),
  ),
  Quote(
    id: 'l04',
    text: 'The horizon leans forward, offering you space to place new '
        'steps of change.',
    author: 'Maya Angelou',
    category: QuoteCategory.landscapes,
    imageAsset: _img(QuoteCategory.landscapes, 3),
  ),
  Quote(
    id: 'l05',
    text: 'We travel not to escape life, but for life not to escape us.',
    author: 'Lumora Journal',
    category: QuoteCategory.landscapes,
    imageAsset: _img(QuoteCategory.landscapes, 0),
  ),
  Quote(
    id: 'l06',
    text: 'Every sunrise is an invitation to widen our perspective.',
    author: 'Lumora Journal',
    category: QuoteCategory.landscapes,
    imageAsset: _img(QuoteCategory.landscapes, 1),
  ),
  Quote(
    id: 'l07',
    text: 'The mountains are calling, and I must go.',
    author: 'John Muir',
    category: QuoteCategory.landscapes,
    imageAsset: _img(QuoteCategory.landscapes, 2),
  ),
  Quote(
    id: 'l08',
    text: 'What lies behind us and what lies before us are tiny matters '
        'compared to what lies within us.',
    author: 'Ralph Waldo Emerson',
    category: QuoteCategory.landscapes,
    imageAsset: _img(QuoteCategory.landscapes, 3),
  ),
  Quote(
    id: 'l09',
    text: 'Somewhere between the mountain and the sea, a door opens that '
        'you didn\'t know was there.',
    author: 'Lumora Journal',
    category: QuoteCategory.landscapes,
    imageAsset: _img(QuoteCategory.landscapes, 0),
  ),
  Quote(
    id: 'l10',
    text: 'Live in each season as it passes; breathe the air, drink the '
        'drink, taste the fruit.',
    author: 'Henry David Thoreau',
    category: QuoteCategory.landscapes,
    imageAsset: _img(QuoteCategory.landscapes, 1),
  ),
  Quote(
    id: 'l11',
    text: 'The horizon is not a limit; it is an invitation.',
    author: 'Lumora Journal',
    category: QuoteCategory.landscapes,
    imageAsset: _img(QuoteCategory.landscapes, 2),
  ),
  Quote(
    id: 'l12',
    text: 'Twenty years from now you will be more disappointed by the '
        'things you didn\'t do than by the ones you did.',
    author: 'Mark Twain',
    category: QuoteCategory.landscapes,
    imageAsset: _img(QuoteCategory.landscapes, 3),
  ),
  Quote(
    id: 'l13',
    text: 'There are far better things ahead than any we leave behind.',
    author: 'C.S. Lewis',
    category: QuoteCategory.landscapes,
    imageAsset: _img(QuoteCategory.landscapes, 0),
  ),
  Quote(
    id: 'l14',
    text: 'Distance means so little when someone means so much, and even '
        'less when the view is this wide.',
    author: 'Lumora Journal',
    category: QuoteCategory.landscapes,
    imageAsset: _img(QuoteCategory.landscapes, 1),
  ),
  Quote(
    id: 'l15',
    text: 'The sea, once it casts its spell, holds one in its net of '
        'wonder forever.',
    author: 'Jacques Cousteau',
    category: QuoteCategory.landscapes,
    imageAsset: _img(QuoteCategory.landscapes, 2),
  ),
  Quote(
    id: 'l16',
    text: 'All journeys have secret destinations of which the traveler is '
        'unaware.',
    author: 'Martin Buber',
    category: QuoteCategory.landscapes,
    imageAsset: _img(QuoteCategory.landscapes, 3),
  ),
  Quote(
    id: 'l17',
    text: 'Wide skies make room for wide thinking.',
    author: 'Lumora Journal',
    category: QuoteCategory.landscapes,
    imageAsset: _img(QuoteCategory.landscapes, 0),
  ),
  Quote(
    id: 'l18',
    text: 'Climb the mountain not to plant your flag, but to embrace the '
        'challenge, enjoy the air, and behold the view.',
    author: 'David McCullough Jr.',
    category: QuoteCategory.landscapes,
    imageAsset: _img(QuoteCategory.landscapes, 1),
  ),

  // --- Architecture -------------------------------------------------------
  Quote(
    id: 'a01',
    text: 'Less is more.',
    author: 'Ludwig Mies van der Rohe',
    category: QuoteCategory.architecture,
    imageAsset: _img(QuoteCategory.architecture, 0),
  ),
  Quote(
    id: 'a02',
    text: 'Form follows function.',
    author: 'Louis Sullivan',
    category: QuoteCategory.architecture,
    imageAsset: _img(QuoteCategory.architecture, 1),
  ),
  Quote(
    id: 'a03',
    text: 'Simplicity is the ultimate sophistication.',
    author: 'Leonardo da Vinci',
    category: QuoteCategory.architecture,
    imageAsset: _img(QuoteCategory.architecture, 2),
  ),
  Quote(
    id: 'a04',
    text: 'Architecture is the thoughtful making of space.',
    author: 'Louis Kahn',
    category: QuoteCategory.architecture,
    imageAsset: _img(QuoteCategory.architecture, 3),
  ),
  Quote(
    id: 'a05',
    text: 'Every structure we build is a small argument about what '
        'matters.',
    author: 'Lumora Journal',
    category: QuoteCategory.architecture,
    imageAsset: _img(QuoteCategory.architecture, 0),
  ),
  Quote(
    id: 'a06',
    text: 'The space between things holds as much meaning as the things '
        'themselves.',
    author: 'Lumora Journal',
    category: QuoteCategory.architecture,
    imageAsset: _img(QuoteCategory.architecture, 1),
  ),
  Quote(
    id: 'a07',
    text: 'God is in the details.',
    author: 'Ludwig Mies van der Rohe',
    category: QuoteCategory.architecture,
    imageAsset: _img(QuoteCategory.architecture, 2),
  ),
  Quote(
    id: 'a08',
    text: 'We shape our buildings; thereafter they shape us.',
    author: 'Winston Churchill',
    category: QuoteCategory.architecture,
    imageAsset: _img(QuoteCategory.architecture, 3),
  ),
  Quote(
    id: 'a09',
    text: 'A great building must begin with the unmeasurable, must go '
        'through measurable means when it is being designed, and in the '
        'end must be unmeasurable.',
    author: 'Louis Kahn',
    category: QuoteCategory.architecture,
    imageAsset: _img(QuoteCategory.architecture, 0),
  ),
  Quote(
    id: 'a10',
    text: 'Light falling through a window is also a kind of architecture.',
    author: 'Lumora Journal',
    category: QuoteCategory.architecture,
    imageAsset: _img(QuoteCategory.architecture, 1),
  ),
  Quote(
    id: 'a11',
    text: 'Every great building has a soul that gives it life.',
    author: 'Philip Johnson',
    category: QuoteCategory.architecture,
    imageAsset: _img(QuoteCategory.architecture, 2),
  ),
  Quote(
    id: 'a12',
    text: 'Clarity is a kind of generosity toward the people who will '
        'live inside your plans.',
    author: 'Lumora Journal',
    category: QuoteCategory.architecture,
    imageAsset: _img(QuoteCategory.architecture, 3),
  ),
  Quote(
    id: 'a13',
    text: 'The mother art is architecture. Without an architecture of '
        'our own we have no soul of our own civilization.',
    author: 'Frank Lloyd Wright',
    category: QuoteCategory.architecture,
    imageAsset: _img(QuoteCategory.architecture, 0),
  ),
  Quote(
    id: 'a14',
    text: 'Every staircase is an argument that the climb is worth it.',
    author: 'Lumora Journal',
    category: QuoteCategory.architecture,
    imageAsset: _img(QuoteCategory.architecture, 1),
  ),
  Quote(
    id: 'a15',
    text: 'To create a new beginning for a city, you need to touch the '
        'quality that distinguishes the city from any other city.',
    author: 'I.M. Pei',
    category: QuoteCategory.architecture,
    imageAsset: _img(QuoteCategory.architecture, 2),
  ),
  Quote(
    id: 'a16',
    text: 'An empty room, well lit, is already a kind of promise.',
    author: 'Lumora Journal',
    category: QuoteCategory.architecture,
    imageAsset: _img(QuoteCategory.architecture, 3),
  ),
  Quote(
    id: 'a17',
    text: 'Buildings, like people, hold their history in their posture.',
    author: 'Lumora Journal',
    category: QuoteCategory.architecture,
    imageAsset: _img(QuoteCategory.architecture, 0),
  ),
  Quote(
    id: 'a18',
    text: 'The best doorways don\'t just open; they invite.',
    author: 'Lumora Journal',
    category: QuoteCategory.architecture,
    imageAsset: _img(QuoteCategory.architecture, 1),
  ),
];
