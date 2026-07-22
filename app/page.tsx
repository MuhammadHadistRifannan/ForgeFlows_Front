import Image from "next/image";

export default function Home() {
  return (
    <div className="flex flex-col flex-1 items-center justify-center bg-zinc-50 font-sans dark:bg-black">
      Hello World
      <Image
      src="/assets/images.jpeg"
      alt="Logo"
      width={150}
      height={50}
    />
    </div>
  );
}
