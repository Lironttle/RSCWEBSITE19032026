import AutoScroll from 'embla-carousel-auto-scroll';
import { Carousel, CarouselContent, CarouselItem } from './Carousel';

interface Certificate {
  id: string;
  description: string;
  image: string;
}

const certificates: Certificate[] = [
  { id: 'cert-1', description: 'Environment Agency', image: '/images/certificates/environment-agency.png' },
  { id: 'cert-2', description: 'Constructionline', image: '/images/certificates/constructionline.png' },
  { id: 'cert-3', description: 'Gas Safe', image: '/images/certificates/gas-safe.png' },
  { id: 'cert-4', description: 'NICEIC Approved Contractor', image: '/images/certificates/niceic.png' },
  { id: 'cert-5', description: 'SafeContractor', image: '/images/certificates/safe-contractor.png' },
];

export default function CertificateLogos() {
  return (
    <section className="py-16 bg-white border-y border-gray-100">
      <div className="container-custom flex flex-col items-center text-center mb-10">
        <p className="text-sm font-medium text-muted uppercase tracking-wider">
          Trusted & Accredited
        </p>
      </div>
      <div className="relative mx-auto flex items-center justify-center lg:max-w-5xl">
        <Carousel
          opts={{ loop: true }}
          plugins={[AutoScroll({ playOnInit: true, speed: 1 })]}
        >
          <CarouselContent className="ml-0">
            {certificates.map((cert) => (
              <CarouselItem
                key={cert.id}
                className="flex basis-1/2 justify-center pl-0 sm:basis-1/3 md:basis-1/4 lg:basis-1/5"
              >
                <div className="mx-8 flex shrink-0 items-center justify-center">
                  <img
                    src={cert.image}
                    alt={cert.description}
                    className="h-24 w-auto object-contain"
                  />
                </div>
              </CarouselItem>
            ))}
          </CarouselContent>
        </Carousel>
        <div className="pointer-events-none absolute inset-y-0 left-0 w-12 bg-gradient-to-r from-white to-transparent" />
        <div className="pointer-events-none absolute inset-y-0 right-0 w-12 bg-gradient-to-l from-white to-transparent" />
      </div>
    </section>
  );
}
