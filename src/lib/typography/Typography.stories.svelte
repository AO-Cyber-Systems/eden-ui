<script module>
  import { defineMeta } from '@storybook/addon-svelte-csf';
  import Heading from './heading/Heading.svelte';
  import P from './paragraph/P.svelte';
  import A from './a/A.svelte';
  import List from './list/List.svelte';
  import Li from './list/Li.svelte';
  import Blockquote from './blockquote/Blockquote.svelte';
  import Hr from './hr/Hr.svelte';
  import Img from './img/Img.svelte';
  import Layout from './layout/Layout.svelte';
  import Mark from './mark/Mark.svelte';
  import Secondary from './secondary/Secondary.svelte';
  import Span from './span/Span.svelte';
  import DescriptionList from './descriptionlist/DescriptionList.svelte';

  const { Story } = defineMeta({
    title: 'Components/Typography',
    component: Heading,
    tags: ['autodocs'],
  });
</script>

<!-- ==================== HEADING ==================== -->

<!-- Default Heading -->
<Story name="Heading Default">
  {#snippet children(args)}
    <Heading>Default Heading (H1)</Heading>
  {/snippet}
</Story>

<!-- Heading Tags -->
<Story name="Heading Tags">
  {#snippet children(args)}
    <div class="space-y-4">
      <Heading tag="h1">Heading 1 (5xl, extrabold)</Heading>
      <Heading tag="h2">Heading 2 (4xl)</Heading>
      <Heading tag="h3">Heading 3 (3xl)</Heading>
      <Heading tag="h4">Heading 4 (2xl)</Heading>
      <Heading tag="h5">Heading 5 (xl)</Heading>
      <Heading tag="h6">Heading 6 (lg)</Heading>
    </div>
  {/snippet}
</Story>

<!-- ==================== PARAGRAPH ==================== -->

<!-- Default Paragraph -->
<Story name="Paragraph Default">
  {#snippet children(args)}
    <P>
      Track work across the enterprise through an open, collaborative platform. Link issues across Jira
      and ingest data from other software development tools, so your IT support and operations teams
      have richer contextual information to rapidly respond to requests, incidents, and changes.
    </P>
  {/snippet}
</Story>

<!-- Paragraph Sizes -->
<Story name="Paragraph Sizes">
  {#snippet children(args)}
    <div class="space-y-6">
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-1">Extra Small (xs)</p>
        <P size="xs">The quick brown fox jumps over the lazy dog.</P>
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-1">Small (sm)</p>
        <P size="sm">The quick brown fox jumps over the lazy dog.</P>
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-1">Base (default)</p>
        <P size="base">The quick brown fox jumps over the lazy dog.</P>
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-1">Large (lg)</p>
        <P size="lg">The quick brown fox jumps over the lazy dog.</P>
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-1">Extra Large (xl)</p>
        <P size="xl">The quick brown fox jumps over the lazy dog.</P>
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-1">2XL</p>
        <P size="2xl">The quick brown fox jumps over the lazy dog.</P>
      </div>
    </div>
  {/snippet}
</Story>

<!-- Paragraph Weights -->
<Story name="Paragraph Weights">
  {#snippet children(args)}
    <div class="space-y-4">
      <P weight="thin">Thin weight text</P>
      <P weight="extralight">Extralight weight text</P>
      <P weight="light">Light weight text</P>
      <P weight="normal">Normal weight text (default)</P>
      <P weight="medium">Medium weight text</P>
      <P weight="semibold">Semibold weight text</P>
      <P weight="bold">Bold weight text</P>
      <P weight="extrabold">Extrabold weight text</P>
      <P weight="black">Black weight text</P>
    </div>
  {/snippet}
</Story>

<!-- Paragraph Line Heights -->
<Story name="Paragraph Line Heights">
  {#snippet children(args)}
    <div class="space-y-6">
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-1">Tight</p>
        <P height="tight">
          Track work across the enterprise through an open, collaborative platform. Link issues across Jira
          and ingest data from other software development tools.
        </P>
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-1">Normal (default)</p>
        <P height="normal">
          Track work across the enterprise through an open, collaborative platform. Link issues across Jira
          and ingest data from other software development tools.
        </P>
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-1">Relaxed</p>
        <P height="relaxed">
          Track work across the enterprise through an open, collaborative platform. Link issues across Jira
          and ingest data from other software development tools.
        </P>
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-1">Loose</p>
        <P height="loose">
          Track work across the enterprise through an open, collaborative platform. Link issues across Jira
          and ingest data from other software development tools.
        </P>
      </div>
    </div>
  {/snippet}
</Story>

<!-- Paragraph Alignment -->
<Story name="Paragraph Alignment">
  {#snippet children(args)}
    <div class="space-y-6">
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-1">Left (default)</p>
        <P align="left">
          Track work across the enterprise through an open, collaborative platform.
        </P>
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-1">Center</p>
        <P align="center">
          Track work across the enterprise through an open, collaborative platform.
        </P>
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-1">Right</p>
        <P align="right">
          Track work across the enterprise through an open, collaborative platform.
        </P>
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-1">Justified</p>
        <P justify>
          Track work across the enterprise through an open, collaborative platform. Link issues across Jira
          and ingest data from other software development tools, so your IT support and operations teams
          have richer contextual information.
        </P>
      </div>
    </div>
  {/snippet}
</Story>

<!-- Paragraph Special Styles -->
<Story name="Paragraph Special Styles">
  {#snippet children(args)}
    <div class="space-y-6">
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-1">Italic</p>
        <P italic>This text is styled in italic for emphasis.</P>
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-1">First Letter Uppercase (Drop Cap)</p>
        <P firstUpper>
          Track work across the enterprise through an open, collaborative platform. Link issues across Jira
          and ingest data from other software development tools, so your IT support and operations teams
          have richer contextual information to rapidly respond to requests, incidents, and changes.
        </P>
      </div>
    </div>
  {/snippet}
</Story>

<!-- Paragraph Letter Spacing -->
<Story name="Paragraph Letter Spacing">
  {#snippet children(args)}
    <div class="space-y-4">
      <P space="tighter">Tighter letter spacing</P>
      <P space="tight">Tight letter spacing</P>
      <P space="normal">Normal letter spacing (default)</P>
      <P space="wide">Wide letter spacing</P>
      <P space="wider">Wider letter spacing</P>
      <P space="widest">Widest letter spacing</P>
    </div>
  {/snippet}
</Story>

<!-- ==================== ANCHOR ==================== -->

<!-- Default Anchor -->
<Story name="Anchor Default">
  {#snippet children(args)}
    <P>
      Read more about this topic on our <A href="#">documentation page</A>.
    </P>
  {/snippet}
</Story>

<!-- Anchor Colors -->
<Story name="Anchor Colors">
  {#snippet children(args)}
    <div class="space-y-3">
      <div><A href="#" color="primary">Primary link</A></div>
      <div><A href="#" color="secondary">Secondary link</A></div>
      <div><A href="#" color="blue">Blue link</A></div>
      <div><A href="#" color="green">Green link</A></div>
      <div><A href="#" color="red">Red link</A></div>
      <div><A href="#" color="purple">Purple link</A></div>
      <div><A href="#" color="pink">Pink link</A></div>
      <div><A href="#" color="orange">Orange link</A></div>
      <div><A href="#" color="teal">Teal link</A></div>
      <div><A href="#" color="indigo">Indigo link</A></div>
    </div>
  {/snippet}
</Story>

<!-- Anchor as Button -->
<Story name="Anchor as Button">
  {#snippet children(args)}
    <div class="space-y-4">
      <p class="text-sm text-gray-500 dark:text-gray-400">
        When asButton is true, the anchor renders as a button element styled like a link.
      </p>
      <A asButton onclick={() => alert('Button clicked!')}>Click me (renders as button)</A>
    </div>
  {/snippet}
</Story>

<!-- ==================== LIST ==================== -->

<!-- Unordered List -->
<Story name="List Unordered">
  {#snippet children(args)}
    <List tag="ul">
      <Li>First item in the list</Li>
      <Li>Second item in the list</Li>
      <Li>Third item in the list</Li>
      <Li>Fourth item in the list</Li>
    </List>
  {/snippet}
</Story>

<!-- Ordered List -->
<Story name="List Ordered">
  {#snippet children(args)}
    <List tag="ol">
      <Li>First step in the process</Li>
      <Li>Second step in the process</Li>
      <Li>Third step in the process</Li>
      <Li>Fourth step in the process</Li>
    </List>
  {/snippet}
</Story>

<!-- List Position -->
<Story name="List Position">
  {#snippet children(args)}
    <div class="space-y-6">
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Inside (default)</p>
        <List tag="ul" position="inside">
          <Li>List item with inside position</Li>
          <Li>List item with inside position</Li>
          <Li>List item with inside position</Li>
        </List>
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Outside</p>
        <List tag="ul" position="outside" class="ml-5">
          <Li>List item with outside position</Li>
          <Li>List item with outside position</Li>
          <Li>List item with outside position</Li>
        </List>
      </div>
    </div>
  {/snippet}
</Story>

<!-- Nested Lists -->
<Story name="List Nested">
  {#snippet children(args)}
    <List tag="ul">
      <Li>First level item
        <List tag="ul" class="mt-2 ms-4">
          <Li>Nested item one</Li>
          <Li>Nested item two</Li>
        </List>
      </Li>
      <Li>Another first level item</Li>
      <Li>Third first level item</Li>
    </List>
  {/snippet}
</Story>

<!-- ==================== BLOCKQUOTE ==================== -->

<!-- Default Blockquote -->
<Story name="Blockquote Default">
  {#snippet children(args)}
    <Blockquote>
      "Flowbite is just awesome. It contains tons of prebuilt components and pages starting from
      login screen to complex dashboard. Perfect choice for your next SaaS application."
    </Blockquote>
  {/snippet}
</Story>

<!-- Blockquote with Border -->
<Story name="Blockquote with Border">
  {#snippet children(args)}
    <Blockquote border class="ps-4">
      "Flowbite is just awesome. It contains tons of prebuilt components and pages starting from
      login screen to complex dashboard. Perfect choice for your next SaaS application."
    </Blockquote>
  {/snippet}
</Story>

<!-- Blockquote with Background -->
<Story name="Blockquote with Background">
  {#snippet children(args)}
    <Blockquote bg class="p-4 rounded-lg">
      "Flowbite is just awesome. It contains tons of prebuilt components and pages starting from
      login screen to complex dashboard. Perfect choice for your next SaaS application."
    </Blockquote>
  {/snippet}
</Story>

<!-- Blockquote Sizes -->
<Story name="Blockquote Sizes">
  {#snippet children(args)}
    <div class="space-y-6">
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Small</p>
        <Blockquote size="sm" border class="ps-4">
          "This is a small blockquote."
        </Blockquote>
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Large (default)</p>
        <Blockquote size="lg" border class="ps-4">
          "This is a large blockquote."
        </Blockquote>
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Extra Large (xl)</p>
        <Blockquote size="xl" border class="ps-4">
          "This is an extra large blockquote."
        </Blockquote>
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">2XL</p>
        <Blockquote size="2xl" border class="ps-4">
          "This is a 2xl blockquote."
        </Blockquote>
      </div>
    </div>
  {/snippet}
</Story>

<!-- Blockquote Alignment -->
<Story name="Blockquote Alignment">
  {#snippet children(args)}
    <div class="space-y-6">
      <Blockquote alignment="left" border class="ps-4">
        "Left aligned quote."
      </Blockquote>
      <Blockquote alignment="center">
        "Center aligned quote."
      </Blockquote>
      <Blockquote alignment="right">
        "Right aligned quote."
      </Blockquote>
    </div>
  {/snippet}
</Story>

<!-- ==================== HR ==================== -->

<!-- Default HR -->
<Story name="Hr Default">
  {#snippet children(args)}
    <div>
      <P>Content above the horizontal rule.</P>
      <Hr />
      <P>Content below the horizontal rule.</P>
    </div>
  {/snippet}
</Story>

<!-- HR with Text Content -->
<Story name="Hr with Text">
  {#snippet children(args)}
    <div>
      <P>Content above the horizontal rule.</P>
      <Hr>
        <span class="text-gray-500 dark:text-gray-400">or</span>
      </Hr>
      <P>Content below the horizontal rule.</P>
    </div>
  {/snippet}
</Story>

<!-- HR with Icon -->
<Story name="Hr with Icon">
  {#snippet children(args)}
    <div>
      <P>Content above the horizontal rule.</P>
      <Hr>
        <svg class="w-4 h-4 text-gray-500 dark:text-gray-400" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 18 14">
          <path d="M6 0H2a2 2 0 0 0-2 2v4a2 2 0 0 0 2 2h4v1a3 3 0 0 1-3 3H2a1 1 0 0 0 0 2h1a5.006 5.006 0 0 0 5-5V2a2 2 0 0 0-2-2Zm10 0h-4a2 2 0 0 0-2 2v4a2 2 0 0 0 2 2h4v1a3 3 0 0 1-3 3h-1a1 1 0 0 0 0 2h1a5.006 5.006 0 0 0 5-5V2a2 2 0 0 0-2-2Z"/>
        </svg>
      </Hr>
      <P>Content below the horizontal rule.</P>
    </div>
  {/snippet}
</Story>

<!-- ==================== IMG ==================== -->

<!-- Default Image -->
<Story name="Img Default">
  {#snippet children(args)}
    <Img src="https://flowbite.s3.amazonaws.com/docs/gallery/square/image-1.jpg" alt="sample image" />
  {/snippet}
</Story>

<!-- Image Sizes -->
<Story name="Img Sizes">
  {#snippet children(args)}
    <div class="space-y-6">
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Extra Small (xs)</p>
        <Img size="xs" src="https://flowbite.s3.amazonaws.com/docs/gallery/square/image-1.jpg" alt="sample image" />
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Small (sm)</p>
        <Img size="sm" src="https://flowbite.s3.amazonaws.com/docs/gallery/square/image-1.jpg" alt="sample image" />
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Medium (md)</p>
        <Img size="md" src="https://flowbite.s3.amazonaws.com/docs/gallery/square/image-1.jpg" alt="sample image" />
      </div>
    </div>
  {/snippet}
</Story>

<!-- Image with Caption -->
<Story name="Img with Caption">
  {#snippet children(args)}
    <Img
      size="md"
      src="https://flowbite.s3.amazonaws.com/docs/gallery/square/image-1.jpg"
      alt="sample image"
      caption="Image caption goes here"
    />
  {/snippet}
</Story>

<!-- Image Alignment -->
<Story name="Img Alignment">
  {#snippet children(args)}
    <div class="space-y-6">
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Left</p>
        <Img align="left" size="xs" src="https://flowbite.s3.amazonaws.com/docs/gallery/square/image-1.jpg" alt="left aligned" />
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Center</p>
        <Img align="center" size="xs" src="https://flowbite.s3.amazonaws.com/docs/gallery/square/image-1.jpg" alt="center aligned" />
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Right</p>
        <Img align="right" size="xs" src="https://flowbite.s3.amazonaws.com/docs/gallery/square/image-1.jpg" alt="right aligned" />
      </div>
    </div>
  {/snippet}
</Story>

<!-- Image Effects -->
<Story name="Img Effects">
  {#snippet children(args)}
    <div class="space-y-6">
      <p class="text-sm text-gray-500 dark:text-gray-400">Hover over the images to see the effect transition.</p>
      <div class="grid grid-cols-2 md:grid-cols-3 gap-4">
        <div>
          <p class="text-xs text-gray-500 dark:text-gray-400 mb-1">Grayscale</p>
          <Img effect="grayscale" size="xs" src="https://flowbite.s3.amazonaws.com/docs/gallery/square/image-1.jpg" alt="grayscale effect" />
        </div>
        <div>
          <p class="text-xs text-gray-500 dark:text-gray-400 mb-1">Blur</p>
          <Img effect="blur" size="xs" src="https://flowbite.s3.amazonaws.com/docs/gallery/square/image-2.jpg" alt="blur effect" />
        </div>
        <div>
          <p class="text-xs text-gray-500 dark:text-gray-400 mb-1">Invert</p>
          <Img effect="invert" size="xs" src="https://flowbite.s3.amazonaws.com/docs/gallery/square/image-3.jpg" alt="invert effect" />
        </div>
        <div>
          <p class="text-xs text-gray-500 dark:text-gray-400 mb-1">Sepia</p>
          <Img effect="sepia" size="xs" src="https://flowbite.s3.amazonaws.com/docs/gallery/square/image-4.jpg" alt="sepia effect" />
        </div>
        <div>
          <p class="text-xs text-gray-500 dark:text-gray-400 mb-1">Saturate</p>
          <Img effect="saturate" size="xs" src="https://flowbite.s3.amazonaws.com/docs/gallery/square/image-5.jpg" alt="saturate effect" />
        </div>
        <div>
          <p class="text-xs text-gray-500 dark:text-gray-400 mb-1">Hue Rotate</p>
          <Img effect="hue-rotate" size="xs" src="https://flowbite.s3.amazonaws.com/docs/gallery/square/image-1.jpg" alt="hue-rotate effect" />
        </div>
      </div>
    </div>
  {/snippet}
</Story>

<!-- Image with Link -->
<Story name="Img with Link">
  {#snippet children(args)}
    <Img
      href="https://flowbite.com"
      size="sm"
      src="https://flowbite.s3.amazonaws.com/docs/gallery/square/image-1.jpg"
      alt="clickable image"
    />
  {/snippet}
</Story>

<!-- ==================== MARK ==================== -->

<!-- Default Mark -->
<Story name="Mark Default">
  {#snippet children(args)}
    <P>
      This is some text with a <Mark>highlighted portion</Mark> inside of it.
    </P>
  {/snippet}
</Story>

<!-- Mark in Heading -->
<Story name="Mark in Heading">
  {#snippet children(args)}
    <Heading tag="h2">
      Regain <Mark class="px-2 text-white bg-blue-600 rounded-sm dark:bg-blue-500">control</Mark> over your days
    </Heading>
  {/snippet}
</Story>

<!-- ==================== SECONDARY ==================== -->

<!-- Default Secondary -->
<Story name="Secondary Default">
  {#snippet children(args)}
    <P>
      The main content is here. <Secondary>This is secondary, smaller text.</Secondary>
    </P>
  {/snippet}
</Story>

<!-- Secondary Usage -->
<Story name="Secondary Usage">
  {#snippet children(args)}
    <div class="space-y-4">
      <Heading tag="h3">
        Article Title <Secondary class="text-gray-500 dark:text-gray-400">— Published 2024</Secondary>
      </Heading>
      <P>
        Total users: 1,234 <Secondary class="text-gray-500">(+12% from last month)</Secondary>
      </P>
    </div>
  {/snippet}
</Story>

<!-- ==================== SPAN ==================== -->

<!-- Span Text Decorations -->
<Story name="Span Text Decorations">
  {#snippet children(args)}
    <div class="space-y-4">
      <P>Normal text with <Span italic>italic text</Span> inside.</P>
      <P>Normal text with <Span underline>underlined text</Span> inside.</P>
      <P>Normal text with <Span linethrough>strikethrough text</Span> inside.</P>
      <P>Normal text with <Span uppercase>uppercase text</Span> inside.</P>
    </div>
  {/snippet}
</Story>

<!-- Span Gradients -->
<Story name="Span Gradients">
  {#snippet children(args)}
    <div class="space-y-4">
      <Heading tag="h2">
        <Span gradient="skyToEmerald">Sky to Emerald</Span> Gradient
      </Heading>
      <Heading tag="h2">
        <Span gradient="purpleToBlue">Purple to Blue</Span> Gradient
      </Heading>
      <Heading tag="h2">
        <Span gradient="pinkToOrange">Pink to Orange</Span> Gradient
      </Heading>
      <Heading tag="h2">
        <Span gradient="tealToLime">Teal to Lime</Span> Gradient
      </Heading>
      <Heading tag="h2">
        <Span gradient="redToYellow">Red to Yellow</Span> Gradient
      </Heading>
      <Heading tag="h2">
        <Span gradient="indigoToCyan">Indigo to Cyan</Span> Gradient
      </Heading>
    </div>
  {/snippet}
</Story>

<!-- Span Highlights -->
<Story name="Span Highlights">
  {#snippet children(args)}
    <div class="space-y-3">
      <P>Text with <Span highlight="blue">blue highlight</Span>.</P>
      <P>Text with <Span highlight="green">green highlight</Span>.</P>
      <P>Text with <Span highlight="red">red highlight</Span>.</P>
      <P>Text with <Span highlight="yellow">yellow highlight</Span>.</P>
      <P>Text with <Span highlight="purple">purple highlight</Span>.</P>
      <P>Text with <Span highlight="pink">pink highlight</Span>.</P>
      <P>Text with <Span highlight="teal">teal highlight</Span>.</P>
      <P>Text with <Span highlight="orange">orange highlight</Span>.</P>
    </div>
  {/snippet}
</Story>

<!-- Span Decoration Styles -->
<Story name="Span Decoration Styles">
  {#snippet children(args)}
    <div class="space-y-4">
      <P>Text with <Span decoration="solid" decorationColor="blue">solid underline</Span>.</P>
      <P>Text with <Span decoration="double" decorationColor="green">double underline</Span>.</P>
      <P>Text with <Span decoration="dotted" decorationColor="red">dotted underline</Span>.</P>
      <P>Text with <Span decoration="dashed" decorationColor="purple">dashed underline</Span>.</P>
      <P>Text with <Span decoration="wavy" decorationColor="pink">wavy underline</Span>.</P>
    </div>
  {/snippet}
</Story>

<!-- Span Decoration Thickness -->
<Story name="Span Decoration Thickness">
  {#snippet children(args)}
    <div class="space-y-4">
      <P>Text with <Span decorationThickness="1" decorationColor="blue">1px thickness</Span>.</P>
      <P>Text with <Span decorationThickness="2" decorationColor="blue">2px thickness</Span>.</P>
      <P>Text with <Span decorationThickness="4" decorationColor="blue">4px thickness</Span>.</P>
      <P>Text with <Span decorationThickness="8" decorationColor="blue">8px thickness</Span>.</P>
    </div>
  {/snippet}
</Story>

<!-- ==================== DESCRIPTION LIST ==================== -->

<!-- Default Description List -->
<Story name="DescriptionList Default">
  {#snippet children(args)}
    <dl class="grid grid-cols-2 gap-8 max-w-md text-gray-900 dark:text-white">
      <div class="flex flex-col">
        <DescriptionList tag="dt">Email address</DescriptionList>
        <DescriptionList tag="dd">yourname@email.com</DescriptionList>
      </div>
      <div class="flex flex-col">
        <DescriptionList tag="dt">Location</DescriptionList>
        <DescriptionList tag="dd">California, USA</DescriptionList>
      </div>
      <div class="flex flex-col">
        <DescriptionList tag="dt">Phone number</DescriptionList>
        <DescriptionList tag="dd">+1 (555) 123-4567</DescriptionList>
      </div>
      <div class="flex flex-col">
        <DescriptionList tag="dt">Company</DescriptionList>
        <DescriptionList tag="dd">Acme Inc.</DescriptionList>
      </div>
    </dl>
  {/snippet}
</Story>

<!-- ==================== LAYOUT ==================== -->

<!-- Default Layout -->
<Story name="Layout Default">
  {#snippet children(args)}
    <Layout class="format dark:format-invert">
      <Heading tag="h2">Article Title</Heading>
      <P>
        Track work across the enterprise through an open, collaborative platform. Link issues across Jira
        and ingest data from other software development tools, so your IT support and operations teams
        have richer contextual information to rapidly respond to requests, incidents, and changes.
      </P>
      <Blockquote border class="ps-4 my-4">
        "The Layout component provides a wrapper for formatted content."
      </Blockquote>
      <P>
        Additional content goes here. The Layout component helps maintain consistent formatting
        across your typography elements.
      </P>
    </Layout>
  {/snippet}
</Story>

<!-- ==================== COMBINED EXAMPLES ==================== -->

<!-- Complete Article Example -->
<Story name="Complete Article">
  {#snippet children(args)}
    <article class="max-w-2xl">
      <Heading tag="h1">Getting Started with <Span gradient="purpleToBlue">Flowbite</Span></Heading>

      <P class="mt-4 text-gray-500 dark:text-gray-400">
        <Secondary>Published on January 15, 2024</Secondary> by <A href="#">John Doe</A>
      </P>

      <Hr class="my-6" />

      <P size="lg" height="relaxed">
        Flowbite is an open-source library of interactive components built on top of Tailwind CSS
        including buttons, dropdowns, modals, navbars, and more.
      </P>

      <Heading tag="h2" class="mt-8">Key Features</Heading>

      <List tag="ul" class="mt-4">
        <Li>Pre-built components for rapid development</Li>
        <Li>Dark mode support out of the box</Li>
        <Li>Fully responsive and accessible</Li>
        <Li>Works with any framework</Li>
      </List>

      <Blockquote border class="ps-4 my-6">
        "Flowbite is just awesome. It contains tons of prebuilt components and pages starting from
        login screen to complex dashboard. <Mark>Perfect choice</Mark> for your next SaaS application."
      </Blockquote>

      <P>
        Get started by installing Flowbite via npm or yarn. Check out the
        <A href="#">documentation</A> for more details.
      </P>

      <Img
        class="mt-6 rounded-lg"
        size="full"
        src="https://flowbite.s3.amazonaws.com/blocks/marketing-ui/content/content-gallery-3.png"
        alt="Flowbite dashboard"
        caption="Example dashboard built with Flowbite"
      />
    </article>
  {/snippet}
</Story>

<!-- Typography Showcase -->
<Story name="Typography Showcase">
  {#snippet children(args)}
    <div class="space-y-8 max-w-3xl">
      <section>
        <h3 class="text-sm font-semibold text-gray-500 uppercase tracking-wider mb-4">Headings</h3>
        <div class="space-y-2">
          <Heading tag="h1">Heading 1</Heading>
          <Heading tag="h2">Heading 2</Heading>
          <Heading tag="h3">Heading 3</Heading>
          <Heading tag="h4">Heading 4</Heading>
          <Heading tag="h5">Heading 5</Heading>
          <Heading tag="h6">Heading 6</Heading>
        </div>
      </section>

      <Hr />

      <section>
        <h3 class="text-sm font-semibold text-gray-500 uppercase tracking-wider mb-4">Text Styles</h3>
        <div class="space-y-2">
          <P>Regular paragraph text for body content.</P>
          <P italic>Italic paragraph text for emphasis.</P>
          <P weight="bold">Bold paragraph text for strong emphasis.</P>
          <P><Mark>Highlighted text</Mark> for important content.</P>
          <P>Text with <Span underline>underline</Span> decoration.</P>
          <P>Text with <Span linethrough>strikethrough</Span> decoration.</P>
        </div>
      </section>

      <Hr />

      <section>
        <h3 class="text-sm font-semibold text-gray-500 uppercase tracking-wider mb-4">Gradients</h3>
        <div class="space-y-2">
          <Heading tag="h3"><Span gradient="skyToEmerald">Sky to Emerald</Span></Heading>
          <Heading tag="h3"><Span gradient="purpleToBlue">Purple to Blue</Span></Heading>
          <Heading tag="h3"><Span gradient="pinkToOrange">Pink to Orange</Span></Heading>
        </div>
      </section>

      <Hr />

      <section>
        <h3 class="text-sm font-semibold text-gray-500 uppercase tracking-wider mb-4">Links</h3>
        <P>
          Visit our <A href="#" color="primary">primary link</A>,
          <A href="#" color="blue">blue link</A>,
          <A href="#" color="green">green link</A>, or
          <A href="#" color="red">red link</A>.
        </P>
      </section>
    </div>
  {/snippet}
</Story>
