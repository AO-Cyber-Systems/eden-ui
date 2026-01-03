<script lang="ts">
  import { Button, Badge, Card, Tabs, TabItem, Table, TableBody, TableBodyCell, TableBodyRow, TableHead, TableHeadCell, Avatar, Rating, Star } from "flowbite-svelte";
  import { ArrowLeftOutline, PenOutline, TrashBinOutline, ShoppingCartOutline, HeartOutline, ShareNodesOutline } from "flowbite-svelte-icons";

  const product = {
    name: "Apple iMac 27\" Retina 5K",
    category: "Electronics",
    brand: "Apple",
    sku: "IMAC-27-2024",
    price: "$2,999",
    originalPrice: "$3,499",
    discount: "14%",
    status: "In Stock",
    stock: 12,
    rating: 4.8,
    reviews: 234,
    description: "The new iMac features a stunning 27-inch Retina 5K display, powerful M3 chip, and a sleek all-in-one design. Perfect for creative professionals and power users alike.",
    specifications: [
      { label: "Display", value: "27-inch Retina 5K (5120 x 2880)" },
      { label: "Processor", value: "Apple M3 chip" },
      { label: "Memory", value: "16GB unified memory" },
      { label: "Storage", value: "512GB SSD" },
      { label: "Graphics", value: "10-core GPU" },
      { label: "Camera", value: "1080p FaceTime HD camera" }
    ],
    images: [
      "https://flowbite.s3.amazonaws.com/blocks/e-commerce/imac-front.svg"
    ]
  };

  const recentReviews = [
    { user: "Bonnie Green", avatar: "https://flowbite.s3.amazonaws.com/blocks/marketing-ui/avatars/bonnie-green.png", rating: 5, date: "Jan 2, 2026", comment: "Absolutely love this iMac! The display is stunning and performance is incredible." },
    { user: "Thomas Lean", avatar: "https://flowbite.s3.amazonaws.com/blocks/marketing-ui/avatars/thomas-lean.png", rating: 4, date: "Dec 28, 2025", comment: "Great machine for creative work. The only downside is the price point." }
  ];
</script>

<div class="mx-auto max-w-7xl p-4">
  <!-- Breadcrumb & Actions -->
  <div class="mb-6 flex items-center justify-between">
    <div class="flex items-center gap-4">
      <Button color="alternative" size="sm">
        <ArrowLeftOutline class="me-2 h-4 w-4" />
        Back to Products
      </Button>
    </div>
    <div class="flex gap-2">
      <Button color="alternative">
        <PenOutline class="me-2 h-4 w-4" />
        Edit
      </Button>
      <Button color="red">
        <TrashBinOutline class="me-2 h-4 w-4" />
        Delete
      </Button>
    </div>
  </div>

  <div class="grid gap-8 lg:grid-cols-2">
    <!-- Product Images -->
    <div>
      <div class="mb-4 flex h-96 items-center justify-center rounded-lg bg-gray-100 dark:bg-gray-800">
        <img src={product.images[0]} alt={product.name} class="h-72 w-72 object-contain" />
      </div>
      <div class="flex gap-2">
        {#each [1, 2, 3, 4] as _}
          <div class="flex h-20 w-20 cursor-pointer items-center justify-center rounded-lg border border-gray-200 bg-gray-50 dark:border-gray-700 dark:bg-gray-800">
            <img src={product.images[0]} alt="" class="h-14 w-14 object-contain opacity-50" />
          </div>
        {/each}
      </div>
    </div>

    <!-- Product Info -->
    <div>
      <div class="mb-2 flex items-center gap-2">
        <Badge color="blue">{product.category}</Badge>
        <Badge color="green">{product.status}</Badge>
      </div>

      <h1 class="mb-2 text-3xl font-bold text-gray-900 dark:text-white">{product.name}</h1>

      <div class="mb-4 flex items-center gap-2">
        <Rating total={5} rating={product.rating}>
          {#snippet empty()}<Star class="h-5 w-5" fillPercent={0} />{/snippet}
          {#snippet half()}<Star class="h-5 w-5" fillPercent={50} />{/snippet}
          {#snippet full()}<Star class="h-5 w-5" fillPercent={100} />{/snippet}
        </Rating>
        <span class="text-sm text-gray-500 dark:text-gray-400">({product.reviews} reviews)</span>
      </div>

      <div class="mb-4 flex items-baseline gap-2">
        <span class="text-3xl font-bold text-gray-900 dark:text-white">{product.price}</span>
        <span class="text-lg text-gray-500 line-through dark:text-gray-400">{product.originalPrice}</span>
        <Badge color="red">{product.discount} OFF</Badge>
      </div>

      <p class="mb-6 text-gray-600 dark:text-gray-400">{product.description}</p>

      <div class="mb-6 space-y-2 rounded-lg bg-gray-50 p-4 dark:bg-gray-800">
        <div class="flex justify-between">
          <span class="text-gray-500 dark:text-gray-400">Brand</span>
          <span class="font-medium text-gray-900 dark:text-white">{product.brand}</span>
        </div>
        <div class="flex justify-between">
          <span class="text-gray-500 dark:text-gray-400">SKU</span>
          <span class="font-medium text-gray-900 dark:text-white">{product.sku}</span>
        </div>
        <div class="flex justify-between">
          <span class="text-gray-500 dark:text-gray-400">Stock</span>
          <span class="font-medium text-gray-900 dark:text-white">{product.stock} units</span>
        </div>
      </div>

      <div class="flex gap-2">
        <Button class="flex-1">
          <ShoppingCartOutline class="me-2 h-4 w-4" />
          Add to Cart
        </Button>
        <Button color="alternative">
          <HeartOutline class="h-4 w-4" />
        </Button>
        <Button color="alternative">
          <ShareNodesOutline class="h-4 w-4" />
        </Button>
      </div>
    </div>
  </div>

  <!-- Tabs Section -->
  <div class="mt-8">
    <Tabs style="underline">
      <TabItem open title="Specifications">
        <Card class="mt-4 p-6">
          <Table>
            <TableBody>
              {#each product.specifications as spec}
                <TableBodyRow>
                  <TableBodyCell class="font-medium text-gray-900 dark:text-white">{spec.label}</TableBodyCell>
                  <TableBodyCell>{spec.value}</TableBodyCell>
                </TableBodyRow>
              {/each}
            </TableBody>
          </Table>
        </Card>
      </TabItem>
      <TabItem title="Reviews ({product.reviews})">
        <Card class="mt-4 p-6">
          <div class="space-y-6">
            {#each recentReviews as review}
              <div class="border-b border-gray-200 pb-6 last:border-0 dark:border-gray-700">
                <div class="mb-2 flex items-center gap-3">
                  <Avatar src={review.avatar} alt={review.user} size="sm" />
                  <div>
                    <p class="font-medium text-gray-900 dark:text-white">{review.user}</p>
                    <p class="text-xs text-gray-500 dark:text-gray-400">{review.date}</p>
                  </div>
                </div>
                <Rating total={5} rating={review.rating} size={16}>
                  {#snippet empty()}<Star class="h-4 w-4" fillPercent={0} />{/snippet}
                  {#snippet full()}<Star class="h-4 w-4" fillPercent={100} />{/snippet}
                </Rating>
                <p class="mt-2 text-gray-600 dark:text-gray-400">{review.comment}</p>
              </div>
            {/each}
          </div>
        </Card>
      </TabItem>
      <TabItem title="Shipping Info">
        <Card class="mt-4 p-6">
          <div class="space-y-4">
            <div>
              <h4 class="font-semibold text-gray-900 dark:text-white">Free Shipping</h4>
              <p class="text-gray-600 dark:text-gray-400">Free standard shipping on orders over $50</p>
            </div>
            <div>
              <h4 class="font-semibold text-gray-900 dark:text-white">Returns</h4>
              <p class="text-gray-600 dark:text-gray-400">Free returns within 30 days of purchase</p>
            </div>
          </div>
        </Card>
      </TabItem>
    </Tabs>
  </div>
</div>
