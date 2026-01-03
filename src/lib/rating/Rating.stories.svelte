<script module>
  import { defineMeta } from '@storybook/addon-svelte-csf';
  import Rating from './Rating.svelte';
  import Star from './Star.svelte';
  import Heart from './Heart.svelte';
  import Thumbup from './Thumbup.svelte';
  import CustomIcon from './CustomIcon.svelte';
  import AdvancedRating from './AdvancedRating.svelte';
  import ScoreRating from './ScoreRating.svelte';
  import Review from './Review.svelte';
  import RatingComment from './RatingComment.svelte';

  const { Story } = defineMeta({
    title: 'Components/Rating',
    component: Rating,
    tags: ['autodocs'],
    argTypes: {
      total: {
        control: { type: 'number', min: 1, max: 10 },
        description: 'Total number of rating icons',
      },
      rating: {
        control: { type: 'number', min: 0, max: 10, step: 0.1 },
        description: 'Current rating value (supports decimals for partial fill)',
      },
      size: {
        control: { type: 'number', min: 16, max: 48 },
        description: 'Size of the rating icons in pixels',
      },
      count: {
        control: 'boolean',
        description: 'Show rating count display',
      },
    },
    args: {
      total: 5,
      rating: 4,
      size: 24,
      count: false,
    },
  });

  // Advanced rating data
  const advancedRatings = [
    { label: '5 star', rating: 70 },
    { label: '4 star', rating: 17 },
    { label: '3 star', rating: 8 },
    { label: '2 star', rating: 4 },
    { label: '1 star', rating: 1 },
  ];

  // Score rating data
  const scoreRatings = [
    { label: 'Staff', rating: 8.8 },
    { label: 'Comfort', rating: 8.9 },
    { label: 'Free WiFi', rating: 8.8 },
    { label: 'Facilities', rating: 5.4 },
  ];

  const scoreRatings2 = [
    { label: 'Value for money', rating: 8.9 },
    { label: 'Cleanliness', rating: 7.0 },
    { label: 'Location', rating: 8.0 },
  ];

  // Review data
  const reviewData = {
    imgSrc: 'https://flowbite.com/docs/images/people/profile-picture-2.jpg',
    imgAlt: 'Jese Leos',
    name: 'Jese Leos',
    address: 'United States',
    title: 'Thinking to buy another one!',
    rating: 4.5,
    reviewDate: 'January 20, 2024',
  };

  // Comment data
  const commentData = {
    user: {
      name: 'Michael Gough',
      img: {
        src: 'https://flowbite.com/docs/images/people/profile-picture-5.jpg',
        alt: 'Michael Gough',
      },
      joined: 'Joined on August 2014',
    },
    total: 5,
    rating: 4,
    heading: 'Great product quality',
    address: 'United Kingdom',
    datetime: 'March 25, 2024',
  };

  // Lightning bolt SVG path for custom icon demo
  const lightningPath = 'M13 2L3 14h8l-1 8 10-12h-8l1-8z';
</script>

<!-- Default Star Rating -->
<Story name="Default">
  {#snippet children(args)}
    <Rating {...args} />
  {/snippet}
</Story>

<!-- Different Rating Values -->
<Story name="Rating Values">
  {#snippet children(args)}
    <div class="space-y-4">
      <div class="flex items-center gap-4">
        <Rating total={5} rating={5} />
        <span class="text-sm text-gray-500 dark:text-gray-400">5.0 - Excellent</span>
      </div>
      <div class="flex items-center gap-4">
        <Rating total={5} rating={4} />
        <span class="text-sm text-gray-500 dark:text-gray-400">4.0 - Very Good</span>
      </div>
      <div class="flex items-center gap-4">
        <Rating total={5} rating={3.5} />
        <span class="text-sm text-gray-500 dark:text-gray-400">3.5 - Good (partial star)</span>
      </div>
      <div class="flex items-center gap-4">
        <Rating total={5} rating={2.3} />
        <span class="text-sm text-gray-500 dark:text-gray-400">2.3 - Fair (partial star)</span>
      </div>
      <div class="flex items-center gap-4">
        <Rating total={5} rating={1} />
        <span class="text-sm text-gray-500 dark:text-gray-400">1.0 - Poor</span>
      </div>
    </div>
  {/snippet}
</Story>

<!-- Size Variants -->
<Story name="Size Variants">
  {#snippet children(args)}
    <div class="space-y-4">
      <div class="flex items-center gap-4">
        <Rating total={5} rating={4} size={16} />
        <span class="text-sm text-gray-500 dark:text-gray-400">Small (16px)</span>
      </div>
      <div class="flex items-center gap-4">
        <Rating total={5} rating={4} size={24} />
        <span class="text-sm text-gray-500 dark:text-gray-400">Medium (24px)</span>
      </div>
      <div class="flex items-center gap-4">
        <Rating total={5} rating={4} size={32} />
        <span class="text-sm text-gray-500 dark:text-gray-400">Large (32px)</span>
      </div>
      <div class="flex items-center gap-4">
        <Rating total={5} rating={4} size={48} />
        <span class="text-sm text-gray-500 dark:text-gray-400">Extra Large (48px)</span>
      </div>
    </div>
  {/snippet}
</Story>

<!-- With Text -->
<Story name="With Text">
  {#snippet children(args)}
    <Rating total={5} rating={4.5}>
      {#snippet text()}
        <p class="ms-2 text-sm font-medium text-gray-500 dark:text-gray-400">
          4.5 out of 5
        </p>
      {/snippet}
    </Rating>
  {/snippet}
</Story>

<!-- With Count -->
<Story name="With Count">
  {#snippet children(args)}
    <div class="space-y-4">
      <Rating total={5} rating={4.5} count>
        {#snippet text()}
          <p class="ms-2 text-sm font-bold text-gray-900 dark:text-white">4.95</p>
          <span class="mx-1.5 h-1 w-1 rounded-full bg-gray-500 dark:bg-gray-400"></span>
          <a href="#" class="text-sm font-medium text-gray-900 underline hover:no-underline dark:text-white">73 reviews</a>
        {/snippet}
      </Rating>
    </div>
  {/snippet}
</Story>

<!-- Heart Icon -->
<Story name="Heart Rating">
  {#snippet children(args)}
    <div class="space-y-4">
      <div class="flex items-center gap-4">
        <Rating total={5} rating={5} icon={Heart} />
        <span class="text-sm text-gray-500 dark:text-gray-400">5 Hearts</span>
      </div>
      <div class="flex items-center gap-4">
        <Rating total={5} rating={3.5} icon={Heart} />
        <span class="text-sm text-gray-500 dark:text-gray-400">3.5 Hearts (partial)</span>
      </div>
      <div class="flex items-center gap-4">
        <Rating total={5} rating={2} icon={Heart} size={32} />
        <span class="text-sm text-gray-500 dark:text-gray-400">Large Hearts</span>
      </div>
    </div>
  {/snippet}
</Story>

<!-- Thumbup Icon -->
<Story name="Thumbup Rating">
  {#snippet children(args)}
    <div class="space-y-4">
      <div class="flex items-center gap-4">
        <Rating total={5} rating={4} icon={Thumbup} />
        <span class="text-sm text-gray-500 dark:text-gray-400">4 Thumbs Up</span>
      </div>
      <div class="flex items-center gap-4">
        <Rating total={5} rating={2.5} icon={Thumbup} />
        <span class="text-sm text-gray-500 dark:text-gray-400">2.5 Thumbs (partial)</span>
      </div>
    </div>
  {/snippet}
</Story>

<!-- Custom Icon -->
<Story name="Custom Icon">
  {#snippet children(args)}
    <div class="space-y-4">
      <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Custom Lightning Bolt Icon</p>
      <Rating total={5} rating={4} icon={CustomIcon} iconProps={{ pathd: lightningPath, fillColor: '#f59e0b', strokeColor: '#f59e0b' }} />
      <p class="text-sm text-gray-500 dark:text-gray-400 mt-4 mb-2">Custom Heart with Custom Colors</p>
      <Rating total={5} rating={3.5} icon={CustomIcon} iconProps={{ fillColor: '#ec4899', strokeColor: '#ec4899' }} />
    </div>
  {/snippet}
</Story>

<!-- Individual Star Component -->
<Story name="Star Component">
  {#snippet children(args)}
    <div class="space-y-4">
      <p class="text-sm font-medium text-gray-900 dark:text-white mb-2">Individual Star Icons</p>
      <div class="flex items-center gap-2">
        <Star fillPercent={100} size={32} />
        <Star fillPercent={75} size={32} />
        <Star fillPercent={50} size={32} />
        <Star fillPercent={25} size={32} />
        <Star fillPercent={0} size={32} />
      </div>
      <p class="text-xs text-gray-500 dark:text-gray-400">100%, 75%, 50%, 25%, 0% fill</p>
    </div>
  {/snippet}
</Story>

<!-- Advanced Rating (Bar Chart) -->
<Story name="Advanced Rating">
  {#snippet children(args)}
    <div class="max-w-md">
      <AdvancedRating ratings={advancedRatings}>
        {#snippet rating()}
          <Rating total={5} rating={4.5}>
            {#snippet text()}
              <p class="ms-2 text-sm font-medium text-gray-500 dark:text-gray-400">4.95 out of 5</p>
            {/snippet}
          </Rating>
        {/snippet}
        {#snippet globalText()}
          <p class="mt-2 text-sm font-medium text-gray-500 dark:text-gray-400">1,745 global ratings</p>
        {/snippet}
      </AdvancedRating>
    </div>
  {/snippet}
</Story>

<!-- Score Rating -->
<Story name="Score Rating">
  {#snippet children(args)}
    <div class="max-w-lg">
      <ScoreRating
        ratings={scoreRatings}
        ratings2={scoreRatings2}
        headerLabel={{ desc1: 'Category', desc2: 'Rating', desc3: 'Category', desc4: 'Rating' }}
      />
    </div>
  {/snippet}
</Story>

<!-- Review Component -->
<Story name="Review">
  {#snippet children(args)}
    <div class="max-w-lg">
      <Review review={reviewData}>
        {#snippet item()}
          <Rating total={5} rating={reviewData.rating} size={20}>
            {#snippet text()}
              <span class="ms-2 text-sm font-semibold text-gray-900 dark:text-white">{reviewData.rating}</span>
            {/snippet}
          </Rating>
        {/snippet}
        <p class="mb-2 text-gray-500 dark:text-gray-400">
          This is my third Hooded Jacket, and I love them all! The fabric is super soft, and it's really comfortable to wear.
          I especially love the hoodie style, which is perfect for cooler days.
        </p>
        <p class="mb-3 text-gray-500 dark:text-gray-400">
          It fits true to size, and I ordered an extra one because I liked it so much.
        </p>
        <a href="#" class="block mb-5 text-sm font-medium text-primary-600 hover:underline dark:text-primary-500">
          Read more
        </a>
        <aside>
          <p class="mt-1 text-xs text-gray-500 dark:text-gray-400">19 people found this helpful</p>
          <div class="mt-3 flex items-center space-x-3 divide-x divide-gray-200 dark:divide-gray-600">
            <button class="bg-primary-700 hover:bg-primary-800 focus:ring-primary-300 dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800 rounded-lg px-2 py-1.5 text-xs font-medium text-white focus:outline-none focus:ring-4">
              Helpful
            </button>
            <a href="#" class="ps-4 text-sm font-medium text-primary-600 hover:underline dark:text-primary-500">Report abuse</a>
          </div>
        </aside>
      </Review>
    </div>
  {/snippet}
</Story>

<!-- Rating Comment -->
<Story name="Rating Comment">
  {#snippet children(args)}
    <div class="max-w-lg">
      <RatingComment
        comment={commentData}
        helpfullink="/"
        abuselink="/"
      >
        {#snippet evaluation()}
          19 people found this helpful
        {/snippet}
        <p class="mb-2 text-gray-500 dark:text-gray-400">
          This is a great product! The quality is excellent and it arrived quickly.
          I've been using it daily and it has exceeded my expectations.
        </p>
        <p class="text-gray-500 dark:text-gray-400">
          I would highly recommend this to anyone looking for a reliable solution.
        </p>
      </RatingComment>
    </div>
  {/snippet}
</Story>

<!-- Product Rating Card Example -->
<Story name="Product Card Example">
  {#snippet children(args)}
    <div class="max-w-sm p-4 border rounded-lg dark:border-gray-700">
      <img class="w-full h-48 object-cover rounded-lg mb-4" src="https://flowbite.com/docs/images/products/apple-watch.png" alt="Product" />
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white mb-2">Apple Watch Series 9</h3>
      <div class="flex items-center mb-2">
        <Rating total={5} rating={4.5} size={18}>
          {#snippet text()}
            <span class="ms-2 text-sm font-medium text-gray-500 dark:text-gray-400">4.5 (128 reviews)</span>
          {/snippet}
        </Rating>
      </div>
      <div class="flex items-center justify-between">
        <span class="text-2xl font-bold text-gray-900 dark:text-white">$399</span>
        <button class="text-white bg-primary-700 hover:bg-primary-800 focus:ring-4 focus:outline-none focus:ring-primary-300 font-medium rounded-lg text-sm px-5 py-2.5 dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800">
          Add to cart
        </button>
      </div>
    </div>
  {/snippet}
</Story>

<!-- Interactive Rating Example -->
<Story name="Interactive Example">
  {#snippet children(args)}
    <div class="max-w-md p-4 border rounded-lg dark:border-gray-700">
      <h3 class="text-lg font-medium text-gray-900 dark:text-white mb-4">Rate your experience</h3>
      <div class="space-y-4">
        <div>
          <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Product Quality</p>
          <Rating total={5} rating={4} size={28} />
        </div>
        <div>
          <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Delivery Speed</p>
          <Rating total={5} rating={5} size={28} />
        </div>
        <div>
          <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Customer Service</p>
          <Rating total={5} rating={3.5} size={28} />
        </div>
        <div class="pt-4 border-t dark:border-gray-700">
          <p class="text-sm font-medium text-gray-900 dark:text-white">Overall</p>
          <Rating total={5} rating={4.2} size={32}>
            {#snippet text()}
              <span class="ms-2 text-lg font-bold text-gray-900 dark:text-white">4.2</span>
            {/snippet}
          </Rating>
        </div>
      </div>
    </div>
  {/snippet}
</Story>
